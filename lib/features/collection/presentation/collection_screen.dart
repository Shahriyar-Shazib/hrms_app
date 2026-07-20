import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/auth/current_user_provider.dart';
import '../../../features/renters/application/renters_controller.dart';
import '../../houses/application/houses_controller.dart';
import '../../rooms/application/rooms_controller.dart';
import '../../dues/presentation/waive_due_dialog.dart';
import '../application/collection_controller.dart';
import '../data/collection_repository.dart';
import '../data/models/collection.dart';
import '../print/a4_invoice_pdf.dart';
import '../print/build_print_data.dart';
import '../print/print_data.dart';
import '../print/thermal_receipt_pdf.dart';
import '../../../l10n/app_localizations.dart';

String _monthName(AppLocalizations loc, int month) => [
      loc.monthName1, loc.monthName2, loc.monthName3, loc.monthName4,
      loc.monthName5, loc.monthName6, loc.monthName7, loc.monthName8,
      loc.monthName9, loc.monthName10, loc.monthName11, loc.monthName12,
    ][month - 1];

String _invoiceStatusLabel(AppLocalizations loc, String status) =>
    switch (status) {
      'UNPAID' => loc.invoiceStatusUnpaid,
      'PARTIAL' => loc.invoiceStatusPartial,
      'PAID' => loc.invoiceStatusPaid,
      'CLOSED' => loc.invoiceStatusClosed,
      _ => status,
    };

const _paymentMethods = ['CASH', 'BANK', 'MOBILE'];

String _paymentMethodLabel(AppLocalizations loc, String m) => switch (m) {
      'CASH' => loc.paymentMethodCash,
      'BANK' => loc.paymentMethodBank,
      'MOBILE' => loc.paymentMethodMobile,
      _ => m,
    };

class CollectionScreen extends ConsumerStatefulWidget {
  const CollectionScreen({
    super.key,
    required this.houseId,
    required this.renterId,
  });

  final String houseId;
  final String renterId;

  @override
  ConsumerState<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends ConsumerState<CollectionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _referenceController = TextEditingController();
  final _notesController = TextEditingController();

  String _paymentMethod = 'CASH';
  bool _isSubmitting = false;
  String? _collectError;
  CollectResult? _collectResult;

  // Captured right before the collect POST — the ONLY reliable source for
  // printable invoice/line-item/due-label content (see build_print_data.dart
  // for why the collect response's own `invoice` field must not be used).
  CollectionPreview? _previewSnapshot;

  @override
  void dispose() {
    _amountController.dispose();
    _referenceController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _isSubmitting = true;
      _collectError = null;
    });

    // Captured before the await (release-mode "ref after unmount" gotcha —
    // same pattern as login/change-password): the preview snapshot BEFORE
    // this payment is applied, since post-collect a paid-off due/invoice can
    // no longer be resolved from the (now stale) provider state either.
    final previewSnapshot =
        ref.read(previewProvider((widget.houseId, widget.renterId))).asData?.value;
    final repo = ref.read(collectionRepositoryProvider);

    try {
      final result = await repo.collect(
            widget.houseId,
            widget.renterId,
            amount: _amountController.text.trim(),
            paymentMethod: _paymentMethod,
            reference: _referenceController.text.trim().isEmpty
                ? null
                : _referenceController.text.trim(),
            notes: _notesController.text.trim().isEmpty
                ? null
                : _notesController.text.trim(),
          );
      if (!mounted) return;
      setState(() {
        _isSubmitting = false;
        _collectResult = result;
        _previewSnapshot = previewSnapshot;
      });
    } on ApiException catch (e) {
      if (!mounted) return;
      final loc = AppLocalizations.of(context)!;
      setState(() {
        _isSubmitting = false;
        _collectError = e.code == 'NETWORK_ERROR'
            ? loc.mustBeOnlineToCollect
            : e.message;
      });
    } catch (_) {
      if (!mounted) return;
      final loc = AppLocalizations.of(context)!;
      setState(() {
        _isSubmitting = false;
        _collectError = loc.unexpectedErrorRetry;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final renterAsync =
        ref.watch(renterDetailProvider((widget.houseId, widget.renterId)));
    final renterName =
        renterAsync.asData?.value?.fullName ?? loc.collectPaymentButton;

    // Resolved client-side from cached lists (SPEC §5.11/§5.12: payloads
    // carry only ids) — the renter currently assigned to a room, so this
    // also works for dues-only payments with no invoice.
    final houseName =
        ref.watch(houseDetailProvider(widget.houseId)).asData?.value?.name ??
            '—';
    final rooms = ref.watch(roomsControllerProvider(widget.houseId)).asData?.value ?? const [];
    final roomNumber = rooms
            .where((r) => r.currentRenter?.id == widget.renterId)
            .firstOrNull
            ?.roomNumber ??
        '—';

    return Scaffold(
      appBar: AppBar(title: Text(renterName)),
      body: _collectResult != null
          ? _SuccessSection(
              result: _collectResult!,
              previewSnapshot: _previewSnapshot,
              houseName: houseName,
              renterName: renterName,
              roomNumber: roomNumber,
              onDone: () {
                ref.invalidate(
                    previewProvider((widget.houseId, widget.renterId)));
                context.pop();
              },
            )
          : _buildFormBody(context),
    );
  }

  Widget _buildFormBody(BuildContext context) {
    final previewAsync =
        ref.watch(previewProvider((widget.houseId, widget.renterId)));

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _PreviewCard(
            previewAsync: previewAsync,
            houseId: widget.houseId,
            renterId: widget.renterId,
          ),
          const SizedBox(height: 20),
          _buildForm(context, previewAsync.asData?.value),
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context, CollectionPreview? preview) {
    final loc = AppLocalizations.of(context)!;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(loc.paymentDetailsSectionTitle,
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          TextFormField(
            controller: _amountController,
            keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: loc.amountLabel,
              prefixText: '৳ ',
              hintText: '0.00',
              border: const OutlineInputBorder(),
              helperText: preview != null
                  ? loc.outstandingHelper(preview.grandTotalOutstanding)
                  : null,
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return loc.enterAnAmount;
              }
              try {
                final d = Decimal.parse(value.trim());
                if (d <= Decimal.zero) return loc.amountMustBeGreaterThanZero;
              } catch (_) {
                return loc.enterValidAmount;
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            initialValue: _paymentMethod,
            decoration: InputDecoration(
              labelText: loc.paymentMethodLabel,
              border: const OutlineInputBorder(),
            ),
            items: _paymentMethods
                .map((m) => DropdownMenuItem(
                    value: m, child: Text(_paymentMethodLabel(loc, m))))
                .toList(),
            onChanged: (v) {
              if (v != null) _paymentMethod = v;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _referenceController,
            decoration: InputDecoration(
              labelText: loc.referenceLabel,
              hintText: loc.referenceHint,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _notesController,
            maxLines: 2,
            decoration: InputDecoration(
              labelText: loc.notesOptionalLabel,
              border: const OutlineInputBorder(),
            ),
          ),
          if (_collectError != null) ...[
            const SizedBox(height: 12),
            _ErrorBanner(message: _collectError!),
          ],
          const SizedBox(height: 20),
          FilledButton(
            onPressed: _isSubmitting ? null : _submit,
            child: _isSubmitting
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(loc.collectButton),
          ),
        ],
      ),
    );
  }
}

// ─── Preview card ─────────────────────────────────────────────────────────────

class _PreviewCard extends ConsumerWidget {
  const _PreviewCard({
    required this.previewAsync,
    required this.houseId,
    required this.renterId,
  });

  final AsyncValue<CollectionPreview> previewAsync;
  final String houseId;
  final String renterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return previewAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) {
        final loc = AppLocalizations.of(context)!;
        final msg = e is ApiException
            ? (e.code == 'NETWORK_ERROR'
                ? loc.mustBeOnlineToCollect
                : e.message)
            : 'ERR: ${e.runtimeType} - $e';
        return _ErrorBanner(message: msg);
      },
      data: (preview) => _PreviewContent(
        preview: preview,
        houseId: houseId,
        renterId: renterId,
      ),
    );
  }
}

class _PreviewContent extends ConsumerWidget {
  const _PreviewContent({
    required this.preview,
    required this.houseId,
    required this.renterId,
  });

  final CollectionPreview preview;
  final String houseId;
  final String renterId;

  Future<void> _confirmWaive(
    BuildContext context,
    WidgetRef ref,
    PreviewDue due,
  ) async {
    final waived = await showWaiveDueDialog(
      context,
      houseId: houseId,
      dueId: due.id,
      headLabel: due.headLabel,
      outstanding: due.outstanding,
    );
    if (!waived) return;

    ref.invalidate(previewProvider((houseId, renterId)));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.dueWaived)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final canWaive = ref.watch(canProvider('due.waive'));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Grand total outstanding — prominent
        Card(
          color: colorScheme.primaryContainer,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(loc.totalOutstandingLabel,
                    style: Theme.of(context).textTheme.titleMedium),
                Text(
                  '৳${preview.grandTotalOutstanding}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ),
        // Electricity warning
        if (preview.electricityWarning != null) ...[
          const SizedBox(height: 8),
          Card(
            color: colorScheme.tertiaryContainer,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Icon(Icons.bolt,
                      color: colorScheme.onTertiaryContainer, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      preview.electricityWarning!.message,
                      style: TextStyle(
                          color: colorScheme.onTertiaryContainer,
                          fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        // Current invoice with line-item breakdown
        if (preview.currentInvoice != null) ...[
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        loc.invoiceTitleLine(
                          _monthName(
                              loc, preview.currentInvoice!.billingPeriodMonth),
                          preview.currentInvoice!.billingPeriodYear,
                        ),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        _invoiceStatusLabel(
                            loc, preview.currentInvoice!.status),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: colorScheme.outline),
                      ),
                    ],
                  ),
                  if (preview.currentInvoice!.lineItems.isNotEmpty) ...[
                    const Divider(height: 16),
                    ...preview.currentInvoice!.lineItems.map(
                      (item) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(item.label,
                                style:
                                    Theme.of(context).textTheme.bodySmall),
                            Text('৳${item.amount}',
                                style:
                                    Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                      ),
                    ),
                    const Divider(height: 16),
                  ],
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(loc.invoiceFieldTotal,
                          style: Theme.of(context).textTheme.bodyMedium),
                      Text('৳${preview.currentInvoice!.totalAmount}',
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(loc.outstandingLabel,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w600)),
                      Text(
                        '৳${preview.currentInvoice!.outstanding}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.error,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
        // Outstanding dues
        if (preview.openDues.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text(
            loc.outstandingDuesSectionTitle,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: colorScheme.outline),
          ),
          const SizedBox(height: 4),
          Card(
            child: Column(
              children: preview.openDues
                  .map(
                    (d) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(d.headLabel,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium),
                                Text(
                                  d.dueDate,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: colorScheme.outline),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '৳${d.outstanding}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          if (canWaive) ...[
                            const SizedBox(width: 4),
                            IconButton(
                              icon: Icon(Icons.remove_circle_outline,
                                  size: 20, color: colorScheme.error),
                              tooltip: loc.waiveTooltip,
                              onPressed: () => _confirmWaive(context, ref, d),
                            ),
                          ],
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ],
    );
  }
}

// ─── Success section ──────────────────────────────────────────────────────────

class _SuccessSection extends StatelessWidget {
  const _SuccessSection({
    required this.result,
    required this.previewSnapshot,
    required this.houseName,
    required this.renterName,
    required this.roomNumber,
    required this.onDone,
  });

  final CollectResult result;
  final CollectionPreview? previewSnapshot;
  final String houseName;
  final String renterName;
  final String roomNumber;
  final VoidCallback onDone;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    // Built ONCE and shared by the on-screen "Applied to" list AND the print
    // buttons below, so both are guaranteed to read identically — resolved
    // from the pre-collect preview snapshot, never from result.invoice (which
    // goes null once the paid invoice becomes fully PAID, even though the
    // payment DID apply to it).
    final printData = buildPrintData(
      result: result,
      previewSnapshot: previewSnapshot,
      houseName: houseName,
      renterName: renterName,
      roomNumber: roomNumber,
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(Icons.check_circle_outline,
              size: 72, color: colorScheme.primary),
          const SizedBox(height: 16),
          Text(
            loc.paymentReceivedTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            loc.paymentViaLine(result.payment.amount,
                _paymentMethodLabel(loc, result.payment.paymentMethod)),
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: colorScheme.outline),
          ),
          const SizedBox(height: 24),
          // Applications — same resolved lines the PDF prints (see printData
          // above), so this list and the paper never disagree.
          if (printData.applications.isNotEmpty) ...[
            Text(loc.appliedToSectionTitle,
                style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            Card(
              child: Column(
                children: printData.applications
                    .map(
                      (app) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: Row(
                          children: [
                            const Icon(Icons.arrow_forward, size: 16),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                loc.appliedAmountToDue(app.amount, app.label),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 16),
          ],
          // New outstanding
          Card(
            color: colorScheme.surfaceContainerHighest,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(loc.newOutstandingLabel,
                      style: Theme.of(context).textTheme.bodyMedium),
                  Text(
                    '৳${result.grandTotalOutstanding}',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          _PrintButtonsRow(data: printData),
          const SizedBox(height: 20),
          FilledButton(onPressed: onDone, child: Text(loc.done)),
        ],
      ),
    );
  }
}

// ─── Print buttons ────────────────────────────────────────────────────────────

class _PrintButtonsRow extends StatefulWidget {
  const _PrintButtonsRow({required this.data});

  final PrintData data;

  @override
  State<_PrintButtonsRow> createState() => _PrintButtonsRowState();
}

class _PrintButtonsRowState extends State<_PrintButtonsRow> {
  bool _generatingA4 = false;
  bool _generatingThermal = false;

  Future<void> _printA4() async {
    setState(() => _generatingA4 = true);

    // Captured before the await (release-mode "ref after unmount" gotcha).
    final loc = AppLocalizations.of(context)!;
    final messenger = ScaffoldMessenger.of(context);
    final data = widget.data;

    try {
      await Printing.layoutPdf(
        onLayout: (_) => buildA4InvoicePdf(data),
        name: '${data.invoiceNumber ?? 'invoice'}.pdf',
        format: PdfPageFormat.a4,
      );
    } catch (_) {
      if (!mounted) return;
      messenger.showSnackBar(SnackBar(content: Text(loc.pdfGenerationFailed)));
    } finally {
      if (mounted) setState(() => _generatingA4 = false);
    }
  }

  Future<void> _printThermal() async {
    setState(() => _generatingThermal = true);

    final loc = AppLocalizations.of(context)!;
    final messenger = ScaffoldMessenger.of(context);
    final data = widget.data;
    final paymentId = data.payment.id;
    final shortId =
        paymentId.length >= 6 ? paymentId.substring(paymentId.length - 6) : paymentId;

    try {
      await Printing.layoutPdf(
        onLayout: (_) => buildThermalReceiptPdf(data),
        name: 'receipt-$shortId.pdf',
        format: PdfPageFormat.roll80,
      );
    } catch (_) {
      if (!mounted) return;
      messenger.showSnackBar(SnackBar(content: Text(loc.pdfGenerationFailed)));
    } finally {
      if (mounted) setState(() => _generatingThermal = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final a4Enabled = widget.data.invoiceNumber != null;

    final a4Button = OutlinedButton.icon(
      onPressed: (!a4Enabled || _generatingA4) ? null : _printA4,
      icon: _generatingA4
          ? const SizedBox(
              height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 2))
          : const Icon(Icons.picture_as_pdf_outlined),
      label: Text(loc.invoicePdfButton),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        a4Enabled ? a4Button : Tooltip(message: loc.noInvoiceForPaymentHint, child: a4Button),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: _generatingThermal ? null : _printThermal,
          icon: _generatingThermal
              ? const SizedBox(
                  height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 2))
              : const Icon(Icons.receipt_long_outlined),
          label: Text(loc.receiptPdfButton),
        ),
      ],
    );
  }
}

// ─── Shared small widgets ─────────────────────────────────────────────────────

class _ErrorBanner extends StatelessWidget {
  const _ErrorBanner({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: colorScheme.onErrorContainer),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: colorScheme.onErrorContainer),
            ),
          ),
        ],
      ),
    );
  }
}
