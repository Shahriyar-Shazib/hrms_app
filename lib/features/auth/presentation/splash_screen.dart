import 'package:flutter/material.dart';

/// Shown while [AuthController] resolves the stored session on cold start
/// (reading the token, refreshing if expired). Never shows the login form
/// during this window — only after it resolves to loggedOut do we go there.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
