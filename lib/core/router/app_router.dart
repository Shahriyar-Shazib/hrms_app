import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../auth/auth_controller.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/home_screen.dart';
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

final appRouterProvider = Provider<GoRouter>((ref) {
  final authNotifier = ValueNotifier<AuthState?>(null);

  ref.listen<AsyncValue<AuthState>>(authControllerProvider, (_, next) {
    authNotifier.value = next.asData?.value;
  });

  return GoRouter(
    initialLocation: '/login',
    refreshListenable: authNotifier,
    redirect: (context, state) {
      final authState = authNotifier.value;
      final isLoginRoute = state.matchedLocation == '/login';

      if (authState == null || authState.status == AuthStatus.unknown) {
        return null; // Wait for auth to resolve.
      }

      if (authState.status == AuthStatus.loggedOut) {
        return isLoginRoute ? null : '/login';
      }

      // Logged in.
      return isLoginRoute ? '/home' : null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, _) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, _) => const HomeScreen(),
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
