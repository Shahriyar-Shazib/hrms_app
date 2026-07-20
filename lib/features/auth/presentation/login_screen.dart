import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/auth/auth_controller.dart';
import '../../../core/auth/token_storage.dart';
import '../../../core/api/api_exception.dart';
import '../../../l10n/app_localizations.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  String? _errorMessage;
  bool _obscurePassword = true;
  bool _rememberMe = true;
  // Local spinner state: login() no longer flips the global auth provider to
  // loading (that bounced the router to /splash and unmounted this form), so
  // the screen owns its own submitting flag.
  bool _submitting = false;

  @override
  void initState() {
    super.initState();
    _prefillRememberedCredentials();
  }

  Future<void> _prefillRememberedCredentials() async {
    final remembered =
        await ref.read(tokenStorageProvider).readRememberedCredentials();
    if (remembered == null || !mounted) return;
    final (email, password) = remembered;
    setState(() {
      _emailCtrl.text = email;
      _passwordCtrl.text = password;
      _rememberMe = true;
    });
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _errorMessage = null;
      _submitting = true;
    });

    final email = _emailCtrl.text.trim();
    final password = _passwordCtrl.text;
    final rememberMe = _rememberMe;

    // Captured before the first await: a successful login triggers the
    // router's redirect away from /login, which can unmount this widget
    // before the code below runs. Only plain objects captured here — never
    // `ref`/`context` — may be touched past that point.
    final authNotifier = ref.read(authControllerProvider.notifier);
    final tokenStorage = ref.read(tokenStorageProvider);

    try {
      await authNotifier.login(email: email, password: password);

      // Persist (or clear) remembered credentials regardless of whether this
      // widget is still mounted — it's a storage write, not a UI update.
      if (rememberMe) {
        await tokenStorage.saveRememberedCredentials(
          email: email,
          password: password,
        );
      } else {
        await tokenStorage.clearRememberedCredentials();
      }
    } catch (e) {
      if (!mounted) return;
      final msg = e is ApiException ? e.message : e.toString();
      setState(() => _errorMessage = msg);
    } finally {
      // On success the router unmounts this form (guard mounted); on failure it
      // stays mounted and the spinner must stop.
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final isLoading = _submitting;

    return Scaffold(
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
                  Text(loc.appTitle, style: Theme.of(context).textTheme.headlineLarge),
                  const SizedBox(height: 8),
                  Text(loc.loginSubtitle,
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 32),
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
                          color: Theme.of(context).colorScheme.onErrorContainer,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                  TextFormField(
                    controller: _emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: loc.loginEmailLabel,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (v) =>
                        (v == null || v.isEmpty) ? loc.loginEmailRequired : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordCtrl,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: loc.loginPasswordLabel,
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(_obscurePassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        onPressed: () => setState(
                            () => _obscurePassword = !_obscurePassword),
                      ),
                    ),
                    validator: (v) =>
                        (v == null || v.isEmpty) ? loc.loginPasswordRequired : null,
                    onFieldSubmitted: (_) => _submit(),
                  ),
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(loc.rememberMe),
                    value: _rememberMe,
                    onChanged: (v) => setState(() => _rememberMe = v ?? true),
                  ),
                  const SizedBox(height: 8),
                  FilledButton(
                    onPressed: isLoading ? null : _submit,
                    child: isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(loc.signIn),
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
