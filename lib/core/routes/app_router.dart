import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trading_app/core/routes/app_route_names.dart';
import 'package:trading_app/features/home/presentation/pages/home_screen.dart';
import 'package:trading_app/features/bottom_nav/presentation/pages/main_scaffold.dart';
import 'package:trading_app/features/wallet/presentation/pages/wallet_screen.dart';
import 'package:trading_app/features/support/presentation/pages/support_screen.dart';
import 'package:trading_app/features/ib/presentation/pages/ib_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRouteNames.home,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScaffold(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            preload: false,
            routes: [
              GoRoute(
                path: AppRouteNames.home,
                name: 'home',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            preload: false,
            routes: [
              GoRoute(
                path: AppRouteNames.wallet,
                name: 'wallet',
                builder: (context, state) => const WalletScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            preload: false,
            routes: [
              GoRoute(
                path: AppRouteNames.support,
                name: 'support',
                builder: (context, state) => const SupportScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            preload: false,
            routes: [
              GoRoute(
                path: AppRouteNames.ib,
                name: 'ib',
                builder: (context, state) => const IBScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Error: ${state.error}'))),
  );
}
