import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/auth/auth_controller.dart';
import '../../../core/auth/current_user_provider.dart';
import '../../../core/auth/user_model.dart';
import '../../../core/locale/locale_provider.dart';
import '../../../l10n/app_localizations.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  String _roleLabel(AppLocalizations loc, UserRole? role) => switch (role) {
        UserRole.superAdmin => loc.roleSuperAdmin,
        UserRole.houseOwner => loc.roleHouseOwner,
        UserRole.manager => loc.roleManager,
        null => loc.roleUnknown,
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context)!;
    final user = ref.watch(currentUserProvider);
    final role = ref.watch(currentRoleProvider);
    final canManageManagers = ref.watch(canProvider('manager.manage'));
    final locale = ref.watch(localeProvider);
    final isSuperAdmin = role == UserRole.superAdmin;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.appTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            tooltip: loc.profileTooltip,
            onPressed: () => context.push('/profile'),
          ),
          PopupMenuButton<Locale>(
            icon: const Icon(Icons.language),
            tooltip: loc.languageSwitchTooltip,
            initialValue: locale,
            onSelected: (l) => ref.read(localeProvider.notifier).setLocale(l),
            itemBuilder: (context) => [
              CheckedPopupMenuItem(
                value: const Locale('bn'),
                checked: locale.languageCode == 'bn',
                child: Text(loc.languageBangla),
              ),
              CheckedPopupMenuItem(
                value: const Locale('en'),
                checked: locale.languageCode == 'en',
                child: Text(loc.languageEnglish),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: loc.signOutTooltip,
            onPressed: () =>
                ref.read(authControllerProvider.notifier).logout(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.home, size: 64),
            const SizedBox(height: 16),
            Text(
              loc.homeWelcome(user?.fullName ?? '...'),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Chip(label: Text(_roleLabel(loc, role))),
            const SizedBox(height: 4),
            Text(user?.email ?? '',
                style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: () => context.push('/houses'),
              icon: const Icon(Icons.home_work),
              label: Text(loc.homeHousesButton),
            ),
            if (canManageManagers) ...[
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () => context.push('/managers'),
                icon: const Icon(Icons.badge_outlined),
                label: Text(loc.homeManagersButton),
              ),
            ],
            if (isSuperAdmin) ...[
              const SizedBox(height: 32),
              Text(
                loc.adminSectionTitle,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () => context.push('/owners'),
                icon: const Icon(Icons.manage_accounts_outlined),
                label: Text(loc.ownersTitle),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () => context.push('/audit-logs'),
                icon: const Icon(Icons.fact_check_outlined),
                label: Text(loc.auditLogTitle),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
