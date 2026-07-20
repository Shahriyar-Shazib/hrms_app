import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/auth/auth_controller.dart';
import '../../../core/auth/auth_repository.dart';
import '../../../core/auth/current_user_provider.dart';
import '../../../core/api/api_exception.dart';
import '../../../l10n/app_localizations.dart';

/// Forced/voluntary password change. When the user's status is
/// PASSWORD_RESET_REQUIRED the router pins them here (see app_router redirect)
/// until they complete it — the client is the ONLY enforcement, since the
/// server treats that status as advisory.
class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  ConsumerState<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _currentCtrl = TextEditingController();
  final _newCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();
  bool _obscure = true;
  bool _submitting = false;
  String? _errorMessage;

  @override
  void dispose() {
    _currentCtrl.dispose();
    _newCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _errorMessage = null;
      _submitting = true;
    });

    // Captured before the first await: a successful change tears down the
    // session, and the router redirect unmounts this widget. Only plain
    // objects/notifiers captured here may be touched past the await.
    final loc = AppLocalizations.of(context)!;
    final authRepo = ref.read(authRepositoryProvider);
    final authController = ref.read(authControllerProvider.notifier);

    try {
      await authRepo.changePassword(
        currentPassword: _currentCtrl.text,
        newPassword: _newCtrl.text,
        newPasswordConfirmation: _confirmCtrl.text,
      );
      // Server revoked all tokens + flipped status ACTIVE → clear local
      // session and let the router send us to /login to sign in fresh.
      await authController.clearSessionLocally();
      // No navigation call here: the redirect reacts to loggedOut. Guard
      // any post-await UI touch anyway.
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loc.passwordChangedRelogin)),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessage = e is ApiException ? e.message : e.toString();
        _submitting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final user = ref.watch(currentUserProvider);
    final forced = user?.status == 'PASSWORD_RESET_REQUIRED';

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.changePasswordTitle),
        automaticallyImplyLeading: !forced, // no escape while forced
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: loc.signOutTooltip,
            onPressed: () => ref.read(authControllerProvider.notifier).logout(),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (forced) ...[
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        loc.passwordResetRequiredNotice,
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onTertiaryContainer,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                  if (_errorMessage != null) ...[
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.errorContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _errorMessage!,
                        style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.onErrorContainer,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                  TextFormField(
                    controller: _currentCtrl,
                    obscureText: _obscure,
                    decoration: InputDecoration(
                      labelText: loc.currentPasswordLabel,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (v) => (v == null || v.isEmpty)
                        ? loc.currentPasswordRequired
                        : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _newCtrl,
                    obscureText: _obscure,
                    decoration: InputDecoration(
                      labelText: loc.newPasswordLabel,
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(_obscure
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        onPressed: () => setState(() => _obscure = !_obscure),
                      ),
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return loc.newPasswordRequired;
                      }
                      if (v.length < 8) return loc.newPasswordTooShort;
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _confirmCtrl,
                    obscureText: _obscure,
                    decoration: InputDecoration(
                      labelText: loc.confirmPasswordLabel,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return loc.confirmPasswordRequired;
                      }
                      if (v != _newCtrl.text) return loc.passwordsDoNotMatch;
                      return null;
                    },
                    onFieldSubmitted: (_) => _submit(),
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: _submitting ? null : _submit,
                    child: _submitting
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(loc.changePasswordButton),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
