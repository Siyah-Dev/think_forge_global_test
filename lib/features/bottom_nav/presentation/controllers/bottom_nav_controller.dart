import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trading_app/core/routes/app_route_names.dart';
import 'bottom_nav_state.dart';

/// Provider for bottom navigation state
final bottomNavControllerProvider =
    StateNotifierProvider<BottomNavController, BottomNavState>(
  (ref) => BottomNavController(),
);

/// Controller for bottom navigation
class BottomNavController extends StateNotifier<BottomNavState> {
  BottomNavController()
      : super(
          const BottomNavState(
            selectedIndex: 0,
            currentRoute: AppRouteNames.home,
          ),
        );

  /// Update selected index and route
  void updateSelectedIndex(int index, String route) {
    state = state.copyWith(
      selectedIndex: index,
      currentRoute: route,
    );
  }
}

