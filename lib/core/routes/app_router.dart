import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trading_app/features/home/presentation/pages/home_screen.dart';

class AppRouter {
  
  static final GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(
        path: home,
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Error: ${state.error}'),
      ),
    ),
  );
}

