import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_controller.dart';
import 'user_model.dart';

final currentUserProvider = Provider<User?>((ref) {
  final authState = ref.watch(authControllerProvider);
  return authState.asData?.value.user;
});

final currentRoleProvider = Provider<UserRole?>((ref) {
  return ref.watch(currentUserProvider)?.role;
});

/// Role-based permission helper.
/// Extend this as the API exposes a permissions array on /auth/me.
final canProvider = Provider.family<bool, String>((ref, permission) {
  final role = ref.watch(currentRoleProvider);
  if (role == null) return false;

  // Derive from role until the API returns a permissions list.
  switch (role) {
    case UserRole.superAdmin:
      return true;
    case UserRole.houseOwner:
      const ownerPermissions = {
        'house.view', 'house.edit', 'house.create', 'house.update', 'house.delete',
        'room.view', 'room.edit',
        'renter.view', 'renter.edit',
        'assignment.manage',
        'invoice.view', 'invoice.generate',
        'payment.collect',
        'due.view', 'due.waive',
        'expense.view', 'expense.edit',
        'report.view',
        'manager.assign',
      };
      return ownerPermissions.contains(permission);
    case UserRole.manager:
      const managerPermissions = {
        'house.view',
        'room.view',
        'renter.view',
        'assignment.manage',
        'invoice.view',
        'payment.collect',
        'due.view',
        'expense.view',
        'report.view',
      };
      return managerPermissions.contains(permission);
  }
});
