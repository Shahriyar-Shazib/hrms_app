import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/auth/auth_controller.dart';
import '../../../core/auth/auth_repository.dart';
import '../../../core/auth/current_user_provider.dart';
import '../../../core/auth/user_model.dart';
import '../../../l10n/app_localizations.dart';

String _roleLabel(AppLocalizations loc, UserRole? role) => switch (role) {
      UserRole.superAdmin => loc.roleSuperAdmin,
      UserRole.houseOwner => loc.roleHouseOwner,
      UserRole.manager => loc.roleManager,
      null => loc.roleUnknown,
    };

String _statusLabel(AppLocalizations loc, String? status) => switch (status) {
      'ACTIVE' => loc.ownerStatusActive,
      'SUSPENDED' => loc.ownerStatusSuspended,
      'PASSWORD_RESET_REQUIRED' => loc.ownerStatusResetRequired,
      _ => status ?? loc.roleUnknown,
    };

/// Always Latin digits regardless of app locale (DateTime's fields are
/// formatted via plain int→String padding here, sidestepping intl's
/// Bengali-numeral DateFormat rendering without a new dependency).
String _formatDateTime(AppLocalizations loc, String? iso) {
  if (iso == null || iso.isEmpty) return loc.profileNotSet;
  final dt = DateTime.tryParse(iso)?.toLocal();
  if (dt == null) return iso;
  String two(int n) => n.toString().padLeft(2, '0');
  return '${two(dt.day)}/${two(dt.month)}/${dt.year} ${two(dt.hour)}:${two(dt.minute)}';
}

/// Any logged-in user's own profile: read-only account facts, an editable
/// full_name/mobile form (PATCH /auth/me), and a link into the existing
/// change-password flow (reused, not duplicated — see ChangePasswordScreen).
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _fullNameCtrl;
  late final TextEditingController _mobileCtrl;

  bool _isSubmitting = false;
  Map<String, String> _fieldErrors = {};

  @override
  void initState() {
    super.initState();
    final user = ref.read(currentUserProvider);
    _fullNameCtrl = TextEditingController(text: user?.fullName ?? '');
    _mobileCtrl = TextEditingController(text: user?.mobile ?? '');
  }

  @override
  void dispose() {
    _fullNameCtrl.dispose();
    _mobileCtrl.dispose();
    super.dispose();
  }

  void _clearFieldError(String key) {
    if (_fieldErrors.containsKey(key)) {
      setState(() => _fieldErrors.remove(key));
    }
  }

  Future<void> _submit() async {
    setState(() => _fieldErrors = {});
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final user = ref.read(currentUserProvider);
    final newFullName = _fullNameCtrl.text.trim();
    final newMobile = _mobileCtrl.text.trim();

    // Only send what actually changed — the server ignores anything besides
    // full_name/mobile anyway, but this also avoids re-triggering the
    // `required` rule on full_name when it wasn't touched.
    final fullName = newFullName != (user?.fullName ?? '') ? newFullName : null;
    final mobile = newMobile != (user?.mobile ?? '') ? newMobile : null;

    final loc = AppLocalizations.of(context)!;
    if (fullName == null && mobile == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(loc.saved)));
      return;
    }

    setState(() => _isSubmitting = true);

    // Captured before the first await: a successful save updates
    // authControllerProvider's state, which can rebuild/dispose this widget
    // tree before the request returns. Only plain objects/notifiers captured
    // here may be touched past the await.
    final authRepo = ref.read(authRepositoryProvider);
    final authController = ref.read(authControllerProvider.notifier);
    final messenger = ScaffoldMessenger.of(context);

    try {
      final updated =
          await authRepo.updateProfile(fullName: fullName, mobile: mobile);
      authController.updateCurrentUser(updated);
      if (!mounted) return;
      setState(() => _isSubmitting = false);
      messenger.showSnackBar(SnackBar(content: Text(loc.saved)));
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() => _isSubmitting = false);
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
      } else {
        messenger.showSnackBar(SnackBar(content: Text(e.message)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(title: Text(loc.profileTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(loc.profileAccountSection,
              style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _InfoRow(label: loc.emailLabel, value: user?.email ?? ''),
                  _InfoRow(
                    label: loc.profileRoleLabel,
                    value: _roleLabel(loc, user?.role),
                  ),
                  _InfoRow(
                    label: loc.profileStatusLabel,
                    value: _statusLabel(loc, user?.status),
                  ),
                  _InfoRow(
                    label: loc.profileLastLoginLabel,
                    value: _formatDateTime(loc, user?.lastLoginAt),
                  ),
                  _InfoRow(
                    label: loc.profileMemberSinceLabel,
                    value: _formatDateTime(loc, user?.createdAt),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(loc.profileEditSection,
              style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _fullNameCtrl,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        labelText: '${loc.fullNameLabel} *',
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
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _mobileCtrl,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: loc.mobileLabel,
                        hintText: loc.mobileHint,
                      ),
                      validator: (_) => _fieldErrors.containsKey('mobile')
                          ? _fieldErrors['mobile']
                          : null,
                      onChanged: (_) => _clearFieldError('mobile'),
                    ),
                    const SizedBox(height: 16),
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
          ),
          const SizedBox(height: 24),
          Card(
            child: ListTile(
              leading: const Icon(Icons.lock_outline),
              title: Text(loc.changePasswordTitle),
              subtitle: Text(loc.profileChangePasswordDescription),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.push('/change-password'),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, this.value});

  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(label,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Theme.of(context).colorScheme.outline)),
          ),
          Expanded(child: Text(value ?? '')),
        ],
      ),
    );
  }
}
