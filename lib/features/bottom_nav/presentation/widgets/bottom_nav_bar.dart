import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trading_app/core/routes/app_route_names.dart';
import 'package:trading_app/core/theme/app_colors.dart';
import '../controllers/bottom_nav_controller.dart';

/// Bottom navigation bar widget
class BottomNavBar extends ConsumerWidget {
  final void Function(int)? onItemTapped;

  const BottomNavBar({super.key, this.onItemTapped});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavState = ref.watch(bottomNavControllerProvider);
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive padding based on screen size
    final horizontalPadding = screenWidth > 600 ? 32.0 : 16.0;
    final iconSize = screenWidth > 600 ? 28.0 : 24.0;
    final fontSize = screenWidth > 600 ? 14.0 : 12.0;
    final itemSpacing = screenWidth > 600 ? 24.0 : 16.0;

    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavItem(
                index: 0,
                icon: Image.asset(
                  'assets/icons/home_icon.png',
                  color: bottomNavState.selectedIndex == 0
                      ? AppColors.background
                      : AppColors.textSecondary,
                ),
                label: 'Home',
                isActive: bottomNavState.selectedIndex == 0,
                route: AppRouteNames.home,
                iconSize: iconSize,
                fontSize: fontSize,
                onTap: () =>
                    _handleNavigation(context, ref, 0, AppRouteNames.home),
              ),
              SizedBox(width: itemSpacing),
              _NavItem(
                index: 1,
                icon: Image.asset(
                  'assets/icons/wallet_icon.png',
                  color: bottomNavState.selectedIndex == 1
                      ? AppColors.background
                      : AppColors.textSecondary,
                ),
                label: 'Wallet',
                isActive: bottomNavState.selectedIndex == 1,
                route: AppRouteNames.wallet,
                iconSize: iconSize,
                fontSize: fontSize,
                onTap: () =>
                    _handleNavigation(context, ref, 1, AppRouteNames.wallet),
              ),
              SizedBox(width: itemSpacing),
              _NavItem(
                index: 2,
                icon: Image.asset(
                  'assets/icons/support_icon.png',
                  color: bottomNavState.selectedIndex == 2
                      ? AppColors.background
                      : AppColors.textSecondary,
                ),
                label: 'Support',
                isActive: bottomNavState.selectedIndex == 2,
                route: AppRouteNames.support,
                iconSize: iconSize,
                fontSize: fontSize,
                onTap: () =>
                    _handleNavigation(context, ref, 2, AppRouteNames.support),
              ),
              SizedBox(width: itemSpacing),
              _NavItem(
                index: 3,
                icon: Image.asset(
                  'assets/icons/coins_hand.png',
                  color: bottomNavState.selectedIndex == 3
                      ? AppColors.background
                      : AppColors.textSecondary,
                ),
                label: 'IB',
                isActive: bottomNavState.selectedIndex == 3,
                route: AppRouteNames.ib,
                iconSize: iconSize,
                fontSize: fontSize,
                onTap: () =>
                    _handleNavigation(context, ref, 3, AppRouteNames.ib),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleNavigation(
    BuildContext context,
    WidgetRef ref,
    int index,
    String route,
  ) {
    ref
        .read(bottomNavControllerProvider.notifier)
        .updateSelectedIndex(index, route);

    if (onItemTapped != null) {
      onItemTapped!(index);
    } else {
      context.go(route);
    }
  }
}

/// Individual navigation item widget
class _NavItem extends StatelessWidget {
  final int index;
  final Widget icon;
  final String label;
  final bool isActive;
  final String route;
  final double iconSize;
  final double fontSize;
  final VoidCallback onTap;

  const _NavItem({
    required this.index,
    required this.icon,
    required this.label,
    required this.isActive,
    required this.route,
    required this.iconSize,
    required this.fontSize,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              // Icon(
              //   isActive ? activeIcon : icon,
              //   size: iconSize,
              //   color: isActive ? Colors.black : Colors.grey,
              // ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                  color: isActive ? Colors.black : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
