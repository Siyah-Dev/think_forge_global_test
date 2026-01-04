import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trading_app/core/routes/app_route_names.dart';
import '../controllers/bottom_nav_controller.dart';
import '../widgets/bottom_nav_bar.dart';

class MainScaffold extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainScaffold({
    super.key,
    required this.navigationShell,
  });

  @override
  ConsumerState<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends ConsumerState<MainScaffold> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateBottomNavState();
    });
  }

  @override
  void didUpdateWidget(MainScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.navigationShell.currentIndex != widget.navigationShell.currentIndex) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _updateBottomNavState();
      });
    }
  }

  void _updateBottomNavState() {
    final currentIndex = widget.navigationShell.currentIndex;
    final routes = [
      AppRouteNames.home,
      AppRouteNames.wallet,
      AppRouteNames.support,
      AppRouteNames.ib,
    ];
    
    final currentRoute = routes[currentIndex];
    final controller = ref.read(bottomNavControllerProvider.notifier);
    final currentState = ref.read(bottomNavControllerProvider);
    
    if (currentState.selectedIndex != currentIndex) {
      controller.updateSelectedIndex(currentIndex, currentRoute);
    }
  }

  void _onItemTapped(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavBar(
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
