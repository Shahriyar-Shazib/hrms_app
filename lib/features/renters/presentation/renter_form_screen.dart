import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/api_exception.dart';
import '../data/renters_repository.dart';
import '../data/models/renter.dart';
import '../../../l10n/app_localizations.dart';

class RenterFormScreen extends ConsumerStatefulWidget {
  const RenterFormScreen({super.key, required this.houseId, this.existing});

  final String houseId;

  /// Null → create mode. Non-null → edit mode (prefilled).
  final Renter? existing;

  @override
  ConsumerState<RenterFormScreen> createState() => _RenterFormScreenState();
}

class _RenterFormScreenState extends ConsumerState<RenterFormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Basic
  late final TextEditingController _fullNameCtrl;
  late final TextEditingController _mobileCtrl;
  // Identity
  late final TextEditingController _nidNumberCtrl;
  // Address
  late final TextEditingController _presentAddressCtrl;
  late final TextEditingController _permanentAddressCtrl;
  // Work
  late final TextEditingController _occupationCtrl;
  late final TextEditingController _organizationCtrl;
  // Emergency Contact
  late final TextEditingController _emergencyContactNameCtrl;
  late final TextEditingController _emergencyContactMobileCtrl;
  // Financial
  late final TextEditingController _advanceAmountCtrl;

  bool _isSubmitting = false;
  Map<String, String> _fieldErrors = {};

  bool get _isEditMode => widget.existing != null;

  @override
  void initState() {
    super.initState();
    final r = widget.existing;
    _fullNameCtrl = TextEditingController(text: r?.fullName ?? '');
    _mobileCtrl = TextEditingController(text: r?.mobile ?? '');
    _nidNumberCtrl = TextEditingController(text: r?.nidNumber ?? '');
    _presentAddressCtrl = TextEditingController(text: r?.presentAddress ?? '');
    _permanentAddressCtrl = TextEditingController(
      text: r?.permanentAddress ?? '',
    );
    _occupationCtrl = TextEditingController(text: r?.occupation ?? '');
    _organizationCtrl = TextEditingController(text: r?.organization ?? '');
    _emergencyContactNameCtrl = TextEditingController(
      text: r?.emergencyContactName ?? '',
    );
    _emergencyContactMobileCtrl = TextEditingController(
      text: r?.emergencyContactMobile ?? '',
    );
    final adv = r?.advanceAmount;
    _advanceAmountCtrl = TextEditingController(
      text: (adv != null && adv != '0.00' && adv != '0') ? adv : '',
    );
  }

  @override
  void dispose() {
    _fullNameCtrl.dispose();
    _mobileCtrl.dispose();
    _nidNumberCtrl.dispose();
    _presentAddressCtrl.dispose();
    _permanentAddressCtrl.dispose();
    _occupationCtrl.dispose();
    _organizationCtrl.dispose();
    _emergencyContactNameCtrl.dispose();
    _emergencyContactMobileCtrl.dispose();
    _advanceAmountCtrl.dispose();
    super.dispose();
  }

  String? _trim(TextEditingController c) {
    final v = c.text.trim();
    return v.isEmpty ? null : v;
  }

  void _clearFieldError(String key) {
    if (_fieldErrors.containsKey(key)) {
      setState(() => _fieldErrors.remove(key));
    }
  }

  Future<void> _submit() async {
    setState(() => _fieldErrors = {});

    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _isSubmitting = true);

    try {
      final repo = ref.read(rentersRepositoryProvider);
      if (_isEditMode) {
        await repo.updateRenter(
          widget.houseId,
          widget.existing!.id,
          fullName: _fullNameCtrl.text.trim(),
          mobile: _mobileCtrl.text.trim(),
          nidNumber: _trim(_nidNumberCtrl),
          presentAddress: _trim(_presentAddressCtrl),
          permanentAddress: _trim(_permanentAddressCtrl),
          occupation: _trim(_occupationCtrl),
          organization: _trim(_organizationCtrl),
          emergencyContactName: _trim(_emergencyContactNameCtrl),
          emergencyContactMobile: _trim(_emergencyContactMobileCtrl),
          advanceAmount: _trim(_advanceAmountCtrl),
        );
      } else {
        await repo.createRenter(
          widget.houseId,
          fullName: _fullNameCtrl.text.trim(),
          mobile: _mobileCtrl.text.trim(),
          nidNumber: _trim(_nidNumberCtrl),
          presentAddress: _trim(_presentAddressCtrl),
          permanentAddress: _trim(_permanentAddressCtrl),
          occupation: _trim(_occupationCtrl),
          organization: _trim(_organizationCtrl),
          emergencyContactName: _trim(_emergencyContactNameCtrl),
          emergencyContactMobile: _trim(_emergencyContactMobileCtrl),
          advanceAmount: _trim(_advanceAmountCtrl),
        );
      }

      if (!mounted) return;
      if (_isEditMode) {
        context.pop();
      } else {
        context.go('/houses/${widget.houseId}/renters');
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.saved)));
    } on ApiException catch (e) {
      if (!mounted) return;
      if (e.code == 'VALIDATION_FAILED' && e.details is Map) {
        final raw = e.details as Map<String, dynamic>;
        final errors = <String, String>{};
        for (final entry in raw.entries) {
          final msgs = entry.value;
          if (msgs is List && msgs.isNotEmpty) {
            errors[entry.key] = msgs.first.toString();
          }
        }
        setState(() => _fieldErrors = errors);
        _formKey.currentState!.validate();
      } else if (e.code == 'NETWORK_ERROR') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.mustBeOnlineToSave)),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.message)));
      }
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isEditMode ? loc.editRenterAppBarTitle : loc.newRenterAppBarTitle,
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            physics: const AlwaysScrollableScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              _SectionHeader(loc.sectionBasic),
              TextFormField(
                controller: _fullNameCtrl,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: '${loc.fullNameLabel} *',
                  hintText: loc.fullNameHint,
                ),
                validator: (v) {
                  if (_fieldErrors.containsKey('full_name')) {
                    return _fieldErrors['full_name'];
                  }
                  if (v == null || v.trim().isEmpty) {
                    return loc.fullNameRequired;
                  }
                  return null;
                },
                onChanged: (_) => _clearFieldError('full_name'),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _mobileCtrl,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[\d+\-\s]')),
                ],
                decoration: InputDecoration(
                  labelText: '${loc.mobileLabel} *',
                  hintText: loc.mobileHint,
                ),
                validator: (v) {
                  if (_fieldErrors.containsKey('mobile')) {
                    return _fieldErrors['mobile'];
                  }
                  if (v == null || v.trim().isEmpty) {
                    return loc.mobileRequired;
                  }
                  return null;
                },
                onChanged: (_) => _clearFieldError('mobile'),
              ),
              const SizedBox(height: 20),
              _SectionHeader(loc.sectionIdentity),
              TextFormField(
                controller: _nidNumberCtrl,
                decoration: InputDecoration(
                  labelText: loc.nidNumberLabel,
                  hintText: loc.nidNumberHint,
                ),
                validator: (_) => _fieldErrors.containsKey('nid_number')
                    ? _fieldErrors['nid_number']
                    : null,
                onChanged: (_) => _clearFieldError('nid_number'),
              ),
              const SizedBox(height: 20),
              _SectionHeader(loc.sectionAddress),
              TextFormField(
                controller: _presentAddressCtrl,
                maxLines: 2,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  labelText: loc.presentAddressLabel,
                  alignLabelWithHint: true,
                ),
                validator: (_) => _fieldErrors.containsKey('present_address')
                    ? _fieldErrors['present_address']
                    : null,
                onChanged: (_) => _clearFieldError('present_address'),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _permanentAddressCtrl,
                maxLines: 2,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  labelText: loc.permanentAddressLabel,
                  alignLabelWithHint: true,
                ),
                validator: (_) => _fieldErrors.containsKey('permanent_address')
                    ? _fieldErrors['permanent_address']
                    : null,
                onChanged: (_) => _clearFieldError('permanent_address'),
              ),
              const SizedBox(height: 20),
              _SectionHeader(loc.sectionWork),
              TextFormField(
                controller: _occupationCtrl,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: loc.occupationLabel,
                  hintText: loc.occupationHint,
                ),
                validator: (_) => _fieldErrors.containsKey('occupation')
                    ? _fieldErrors['occupation']
                    : null,
                onChanged: (_) => _clearFieldError('occupation'),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _organizationCtrl,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: loc.organizationLabel,
                  hintText: loc.organizationHint,
                ),
                validator: (_) => _fieldErrors.containsKey('organization')
                    ? _fieldErrors['organization']
                    : null,
                onChanged: (_) => _clearFieldError('organization'),
              ),
              const SizedBox(height: 20),
              _SectionHeader(loc.sectionEmergencyContact),
              TextFormField(
                controller: _emergencyContactNameCtrl,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: loc.contactNameLabel,
                  hintText: loc.contactNameHint,
                ),
                validator: (_) =>
                    _fieldErrors.containsKey('emergency_contact_name')
                    ? _fieldErrors['emergency_contact_name']
                    : null,
                onChanged: (_) => _clearFieldError('emergency_contact_name'),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _emergencyContactMobileCtrl,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[\d+\-\s]')),
                ],
                decoration: InputDecoration(
                  labelText: loc.contactMobileLabel,
                  hintText: loc.contactMobileHint,
                ),
                validator: (_) =>
                    _fieldErrors.containsKey('emergency_contact_mobile')
                    ? _fieldErrors['emergency_contact_mobile']
                    : null,
                onChanged: (_) => _clearFieldError('emergency_contact_mobile'),
              ),
              const SizedBox(height: 20),
              _SectionHeader(loc.sectionFinancial),
              TextFormField(
                controller: _advanceAmountCtrl,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                decoration: InputDecoration(
                  labelText: loc.advanceAmountLabel,
                  hintText: loc.advanceAmountHint,
                  prefixText: '৳ ',
                ),
                validator: (v) {
                  if (_fieldErrors.containsKey('advance_amount')) {
                    return _fieldErrors['advance_amount'];
                  }
                  if (v != null && v.trim().isNotEmpty) {
                    final n = double.tryParse(v.trim());
                    if (n == null || n < 0) {
                      return loc.nonNegativeNumberRequired;
                    }
                  }
                  return null;
                },
                onChanged: (_) => _clearFieldError('advance_amount'),
              ),
              const SizedBox(height: 28),
              FilledButton(
                onPressed: _isSubmitting ? null : _submit,
                child: _isSubmitting
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(loc.save),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
