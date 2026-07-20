import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../auth/auth_controller.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/home_screen.dart';
import '../../features/auth/presentation/splash_screen.dart';
import '../../features/auth/presentation/change_password_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/owners/presentation/owners_screen.dart';
import '../../features/houses/presentation/houses_list_screen.dart';
import '../../features/houses/presentation/house_detail_screen.dart';
import '../../features/rooms/presentation/rooms_list_screen.dart';
import '../../features/rooms/presentation/room_detail_screen.dart';
import '../../features/renters/presentation/renters_list_screen.dart';
import '../../features/renters/presentation/renter_detail_screen.dart';
import '../../features/collection/presentation/collection_screen.dart';
import '../../features/houses/data/models/house.dart';
import '../../features/houses/presentation/house_form_screen.dart';
import '../../features/bill_configs/presentation/bill_configs_screen.dart';
import '../../features/bill_configs/presentation/bill_config_form_screen.dart';
import '../../features/bill_configs/data/models/bill_config.dart';
import '../../features/rooms/presentation/room_form_screen.dart';
import '../../features/rooms/data/models/room.dart';
import '../../features/renters/presentation/renter_form_screen.dart';
import '../../features/renters/data/models/renter.dart';
import '../../features/meter_readings/presentation/meter_readings_screen.dart';
import '../../features/meter_readings/presentation/meter_reading_form_screen.dart';
import '../../features/meter_readings/presentation/meter_reading_adjust_screen.dart';
import '../../features/meter_readings/data/models/meter_reading.dart';
import '../../features/meter_readings/presentation/house_meters_screen.dart';
import '../../features/managers/presentation/managers_screen.dart';
import '../../features/managers/presentation/manager_form_screen.dart';
import '../../features/managers/presentation/house_managers_screen.dart';
import '../../features/expenses/presentation/expenses_screen.dart';
import '../../features/expenses/presentation/expense_form_screen.dart';
import '../../features/expenses/data/models/expense.dart';
import '../../features/reports/presentation/reports_screen.dart';
import '../../features/dues/presentation/renter_dues_screen.dart';
import '../../features/dues/presentation/due_form_screen.dart';
import '../../features/invoices/presentation/invoices_screen.dart';
import '../../features/invoices/presentation/invoice_detail_screen.dart';
import '../../features/invoices/data/models/invoice.dart';
import '../../features/audit/presentation/audit_log_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final authNotifier = ValueNotifier<AuthState?>(null);

  ref.listen<AsyncValue<AuthState>>(authControllerProvider, (_, next) {
    authNotifier.value = next.asData?.value;
  });

  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: authNotifier,
    redirect: (context, state) {
      final authState = authNotifier.value;
      final isSplashRoute = state.matchedLocation == '/splash';
      final isLoginRoute = state.matchedLocation == '/login';

      if (authState == null || authState.status == AuthStatus.unknown) {
        // Still resolving the stored session (cold start) — hold on the
        // splash screen, never fall through to the login form.
        return isSplashRoute ? null : '/splash';
      }

      if (authState.status == AuthStatus.loggedOut) {
        return isLoginRoute ? null : '/login';
      }

      // Logged in. Forced-password-reset guard (client-side security control —
      // the server does NOT block a PASSWORD_RESET_REQUIRED user from other
      // endpoints, so this router gate is the ONLY enforcement). While the
      // status is PASSWORD_RESET_REQUIRED, pin EVERY route to /change-password
      // so deep-links elsewhere bounce back here until the reset completes.
      final mustReset = authState.user?.status == 'PASSWORD_RESET_REQUIRED';
      final isChangePasswordRoute =
          state.matchedLocation == '/change-password';
      if (mustReset) {
        return isChangePasswordRoute ? null : '/change-password';
      }

      // Not reset-required: keep them out of the forced-reset screen's slot on
      // login/splash; a voluntary visit to /change-password is still allowed.
      if (isLoginRoute || isSplashRoute) return '/home';
      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, _) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, _) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, _) => const HomeScreen(),
      ),
      GoRoute(
        path: '/change-password',
        builder: (context, _) => const ChangePasswordScreen(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, _) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/owners',
        builder: (context, _) => const OwnersScreen(),
      ),
      GoRoute(
        path: '/managers',
        builder: (context, _) => const ManagersScreen(),
        routes: [
          GoRoute(
            path: 'new',
            builder: (context, state) => const ManagerFormScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/audit-logs',
        builder: (context, _) => const AuditLogScreen(),
      ),
      GoRoute(
        path: '/houses',
        builder: (context, _) => const HousesListScreen(),
        routes: [
          GoRoute(
            path: 'new',
            builder: (context, state) => const HouseFormScreen(existing: null),
          ),
          GoRoute(
            path: ':id',
            builder: (context, state) => HouseDetailScreen(
              houseId: state.pathParameters['id']!,
            ),
            routes: [
              GoRoute(
                path: 'edit',
                builder: (context, state) => HouseFormScreen(
                  existing: state.extra as House?,
                ),
              ),
              GoRoute(
                path: 'bill-configs',
                builder: (context, state) => BillConfigsScreen(
                  houseId: state.pathParameters['id']!,
                ),
                routes: [
                  GoRoute(
                    path: 'new',
                    builder: (context, state) => BillConfigFormScreen(
                      houseId: state.pathParameters['id']!,
                    ),
                  ),
                  GoRoute(
                    path: 'edit',
                    builder: (context, state) => BillConfigFormScreen(
                      houseId: state.pathParameters['id']!,
                      existing: state.extra as BillConfig?,
                    ),
                  ),
                ],
              ),
              GoRoute(
                path: 'rooms',
                builder: (context, state) => RoomsListScreen(
                  houseId: state.pathParameters['id']!,
                ),
                routes: [
                  GoRoute(
                    path: 'new',
                    builder: (context, state) => RoomFormScreen(
                      houseId: state.pathParameters['id']!,
                    ),
                  ),
                  GoRoute(
                    path: ':roomId',
                    builder: (context, state) => RoomDetailScreen(
                      houseId: state.pathParameters['id']!,
                      roomId: state.pathParameters['roomId']!,
                    ),
                    routes: [
                      GoRoute(
                        path: 'edit',
                        builder: (context, state) => RoomFormScreen(
                          houseId: state.pathParameters['id']!,
                          existing: state.extra as Room?,
                        ),
                      ),
                      GoRoute(
                        path: 'meter-readings',
                        builder: (context, state) => MeterReadingsScreen(
                          houseId: state.pathParameters['id']!,
                          roomId: state.pathParameters['roomId']!,
                        ),
                        routes: [
                          GoRoute(
                            path: 'new',
                            builder: (context, state) => MeterReadingFormScreen(
                              houseId: state.pathParameters['id']!,
                              roomId: state.pathParameters['roomId']!,
                              isFirstReading: state.extra as bool? ?? false,
                            ),
                          ),
                          GoRoute(
                            path: 'adjust',
                            builder: (context, state) =>
                                MeterReadingAdjustScreen(
                              houseId: state.pathParameters['id']!,
                              roomId: state.pathParameters['roomId']!,
                              original: state.extra as MeterReading,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              GoRoute(
                path: 'meters',
                builder: (context, state) => HouseMetersScreen(
                  houseId: state.pathParameters['id']!,
                ),
              ),
              GoRoute(
                path: 'managers',
                builder: (context, state) => HouseManagersScreen(
                  houseId: state.pathParameters['id']!,
                ),
              ),
              GoRoute(
                path: 'expenses',
                builder: (context, state) => ExpensesScreen(
                  houseId: state.pathParameters['id']!,
                ),
                routes: [
                  GoRoute(
                    path: 'new',
                    builder: (context, state) => ExpenseFormScreen(
                      houseId: state.pathParameters['id']!,
                    ),
                  ),
                  GoRoute(
                    path: ':expenseId/edit',
                    builder: (context, state) => ExpenseFormScreen(
                      houseId: state.pathParameters['id']!,
                      existing: state.extra as Expense?,
                    ),
                  ),
                ],
              ),
              GoRoute(
                path: 'reports',
                builder: (context, state) => ReportsScreen(
                  houseId: state.pathParameters['id']!,
                ),
              ),
              GoRoute(
                path: 'invoices',
                builder: (context, state) => InvoicesScreen(
                  houseId: state.pathParameters['id']!,
                ),
                routes: [
                  GoRoute(
                    path: ':invoiceId',
                    builder: (context, state) => InvoiceDetailScreen(
                      houseId: state.pathParameters['id']!,
                      invoiceId: state.pathParameters['invoiceId']!,
                      existing: state.extra as Invoice?,
                    ),
                  ),
                ],
              ),
              GoRoute(
                path: 'renters',
                builder: (context, state) => RentersListScreen(
                  houseId: state.pathParameters['id']!,
                ),
                routes: [
                  GoRoute(
                    path: 'new',
                    builder: (context, state) => RenterFormScreen(
                      houseId: state.pathParameters['id']!,
                    ),
                  ),
                  GoRoute(
                    path: ':renterId',
                    builder: (context, state) => RenterDetailScreen(
                      houseId: state.pathParameters['id']!,
                      renterId: state.pathParameters['renterId']!,
                    ),
                    routes: [
                      GoRoute(
                        path: 'edit',
                        builder: (context, state) => RenterFormScreen(
                          houseId: state.pathParameters['id']!,
                          existing: state.extra as Renter?,
                        ),
                      ),
                      GoRoute(
                        path: 'collect',
                        builder: (context, state) => CollectionScreen(
                          houseId: state.pathParameters['id']!,
                          renterId: state.pathParameters['renterId']!,
                        ),
                      ),
                      GoRoute(
                        path: 'dues',
                        builder: (context, state) => RenterDuesScreen(
                          houseId: state.pathParameters['id']!,
                          renterId: state.pathParameters['renterId']!,
                        ),
                        routes: [
                          GoRoute(
                            path: 'new',
                            builder: (context, state) => DueFormScreen(
                              houseId: state.pathParameters['id']!,
                              renterId: state.pathParameters['renterId']!,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
