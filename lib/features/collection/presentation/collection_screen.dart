import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/api_exception.dart';
import '../../../features/renters/application/renters_controller.dart';
import '../application/collection_controller.dart';
import '../data/collection_repository.dart';
import '../data/models/collection.dart';

const _monthNames = [
  '', 'January', 'February', 'March', 'April', 'May', 'June',
  'July', 'August', 'September', 'October', 'November', 'December',
];

const _paymentMethods = ['CASH', 'BANK', 'MOBILE'];

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
    try {
      final result = await ref.read(collectionRepositoryProvider).collect(
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
      });
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() {
        _isSubmitting = false;
        _collectError = e.code == 'NETWORK_ERROR'
            ? 'You must be online to collect payments.'
            : e.message;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _isSubmitting = false;
        _collectError = 'An unexpected error occurred. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final renterAsync =
        ref.watch(renterDetailProvider((widget.houseId, widget.renterId)));
    final renterName = renterAsync.asData?.value?.fullName ?? 'Collect Payment';

    return Scaffold(
      appBar: AppBar(title: Text(renterName)),
      body: _collectResult != null
          ? _SuccessSection(
              result: _collectResult!,
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
          _PreviewCard(previewAsync: previewAsync),
          const SizedBox(height: 20),
          _buildForm(context, previewAsync.asData?.value),
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context, CollectionPreview? preview) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Payment Details',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          TextFormField(
            controller: _amountController,
            keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Amount',
              prefixText: '৳ ',
              hintText: '0.00',
              border: const OutlineInputBorder(),
              helperText: preview != null
                  ? 'Outstanding: ৳${preview.grandTotalOutstanding}'
                  : null,
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Enter an amount';
              }
              try {
                final d = Decimal.parse(value.trim());
                if (d <= Decimal.zero) return 'Amount must be greater than 0';
              } catch (_) {
                return 'Enter a valid amount (e.g. 1500.00)';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            initialValue: _paymentMethod,
            decoration: const InputDecoration(
              labelText: 'Payment Method',
              border: OutlineInputBorder(),
            ),
            items: _paymentMethods
                .map((m) => DropdownMenuItem(value: m, child: Text(m)))
                .toList(),
            onChanged: (v) {
              if (v != null) _paymentMethod = v;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _referenceController,
            decoration: const InputDecoration(
              labelText: 'Reference (optional)',
              hintText: 'Cheque no., transaction ID…',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _notesController,
            maxLines: 2,
            decoration: const InputDecoration(
              labelText: 'Notes (optional)',
              border: OutlineInputBorder(),
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
                : const Text('Collect'),
          ),
        ],
      ),
    );
  }
}

// ─── Preview card ─────────────────────────────────────────────────────────────

class _PreviewCard extends ConsumerWidget {
  const _PreviewCard({required this.previewAsync});

  final AsyncValue<CollectionPreview> previewAsync;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return previewAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) {
        final msg = e is ApiException
            ? (e.code == 'NETWORK_ERROR'
                ? 'You must be online to collect payments.'
                : e.message)
            : 'ERR: ${e.runtimeType} - $e';
        return _ErrorBanner(message: msg);
      },
      data: (preview) => _PreviewContent(preview: preview),
    );
  }
}

class _PreviewContent extends StatelessWidget {
  const _PreviewContent({required this.preview});

  final CollectionPreview preview;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
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
                Text('Total Outstanding',
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
                        '${_monthNames[preview.currentInvoice!.billingPeriodMonth]} '
                        '${preview.currentInvoice!.billingPeriodYear} Invoice',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        preview.currentInvoice!.status,
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
                      Text('Total',
                          style: Theme.of(context).textTheme.bodyMedium),
                      Text('৳${preview.currentInvoice!.totalAmount}',
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Outstanding',
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
            'Outstanding Dues',
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
  const _SuccessSection({required this.result, required this.onDone});

  final CollectResult result;
  final VoidCallback onDone;

  String _applicationLabel(PaymentApplication app) {
    if (app.targetType == 'INVOICE' && result.invoice != null) {
      final inv = result.invoice!;
      final month = _monthNames[inv.billingPeriodMonth];
      return '৳${app.appliedAmount} → $month ${inv.billingPeriodYear} Invoice';
    }
    if (app.targetType == 'DUE') {
      final due =
          result.openDues.where((d) => d.id == app.targetId).firstOrNull;
      final label = due?.headLabel ?? 'Due';
      return '৳${app.appliedAmount} → $label';
    }
    return '৳${app.appliedAmount} → ${app.targetType}';
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(Icons.check_circle_outline,
              size: 72, color: colorScheme.primary),
          const SizedBox(height: 16),
          Text(
            'Payment Received',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            '৳${result.payment.amount} via ${result.payment.paymentMethod}',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: colorScheme.outline),
          ),
          const SizedBox(height: 24),
          // Applications
          if (result.payment.applications.isNotEmpty) ...[
            Text('Applied to',
                style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            Card(
              child: Column(
                children: result.payment.applications
                    .map(
                      (app) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: Row(
                          children: [
                            const Icon(Icons.arrow_forward, size: 16),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(_applicationLabel(app),
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
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
                  Text('New Outstanding',
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
          const SizedBox(height: 32),
          FilledButton(onPressed: onDone, child: const Text('Done')),
        ],
      ),
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
