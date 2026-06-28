import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_exception.dart';
import '../data/renters_repository.dart';
import '../data/models/renter.dart';

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
    _advanceAmountCtrl = TextEditingController(
      text: (r != null && r.advanceAmount != '0.00' && r.advanceAmount != '0')
          ? r.advanceAmount
          : '',
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
      Navigator.of(context).pop();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Saved')));
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
          const SnackBar(content: Text('You must be online to save.')),
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
    return Scaffold(
      appBar: AppBar(title: Text(_isEditMode ? 'Edit Renter' : 'New Renter')),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            physics: const AlwaysScrollableScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              _SectionHeader('Basic'),
              TextFormField(
                controller: _fullNameCtrl,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Full Name *',
                  hintText: 'e.g. Rahim Uddin',
                ),
                validator: (v) {
                  if (_fieldErrors.containsKey('full_name'))
                    return _fieldErrors['full_name'];
                  if (v == null || v.trim().isEmpty)
                    return 'Full name is required';
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
                decoration: const InputDecoration(
                  labelText: 'Mobile *',
                  hintText: 'e.g. 01711-000000',
                ),
                validator: (v) {
                  if (_fieldErrors.containsKey('mobile'))
                    return _fieldErrors['mobile'];
                  if (v == null || v.trim().isEmpty)
                    return 'Mobile is required';
                  return null;
                },
                onChanged: (_) => _clearFieldError('mobile'),
              ),
              const SizedBox(height: 20),
              _SectionHeader('Identity'),
              TextFormField(
                controller: _nidNumberCtrl,
                decoration: const InputDecoration(
                  labelText: 'NID Number',
                  hintText: 'National ID number',
                ),
                validator: (_) => _fieldErrors.containsKey('nid_number')
                    ? _fieldErrors['nid_number']
                    : null,
                onChanged: (_) => _clearFieldError('nid_number'),
              ),
              const SizedBox(height: 20),
              _SectionHeader('Address'),
              TextFormField(
                controller: _presentAddressCtrl,
                maxLines: 2,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  labelText: 'Present Address',
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
                decoration: const InputDecoration(
                  labelText: 'Permanent Address',
                  alignLabelWithHint: true,
                ),
                validator: (_) => _fieldErrors.containsKey('permanent_address')
                    ? _fieldErrors['permanent_address']
                    : null,
                onChanged: (_) => _clearFieldError('permanent_address'),
              ),
              const SizedBox(height: 20),
              _SectionHeader('Work'),
              TextFormField(
                controller: _occupationCtrl,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Occupation',
                  hintText: 'e.g. Teacher',
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
                decoration: const InputDecoration(
                  labelText: 'Organization',
                  hintText: 'e.g. City College',
                ),
                validator: (_) => _fieldErrors.containsKey('organization')
                    ? _fieldErrors['organization']
                    : null,
                onChanged: (_) => _clearFieldError('organization'),
              ),
              const SizedBox(height: 20),
              _SectionHeader('Emergency Contact'),
              TextFormField(
                controller: _emergencyContactNameCtrl,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Contact Name',
                  hintText: 'e.g. Karim Uddin',
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
                decoration: const InputDecoration(
                  labelText: 'Contact Mobile',
                  hintText: 'e.g. 01711-000001',
                ),
                validator: (_) =>
                    _fieldErrors.containsKey('emergency_contact_mobile')
                    ? _fieldErrors['emergency_contact_mobile']
                    : null,
                onChanged: (_) => _clearFieldError('emergency_contact_mobile'),
              ),
              const SizedBox(height: 20),
              _SectionHeader('Financial'),
              TextFormField(
                controller: _advanceAmountCtrl,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                decoration: const InputDecoration(
                  labelText: 'Advance Amount',
                  hintText: 'e.g. 5000',
                  prefixText: '৳ ',
                ),
                validator: (v) {
                  if (_fieldErrors.containsKey('advance_amount')) {
                    return _fieldErrors['advance_amount'];
                  }
                  if (v != null && v.trim().isNotEmpty) {
                    final n = double.tryParse(v.trim());
                    if (n == null || n < 0)
                      return 'Must be a non-negative number';
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
                    : const Text('Save'),
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
