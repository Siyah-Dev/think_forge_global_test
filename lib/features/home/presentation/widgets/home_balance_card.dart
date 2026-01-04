import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trading_app/core/theme/app_colors.dart';
import 'package:trading_app/features/home/presentation/controllers/home_controller.dart';

class HomeBalanceCard extends ConsumerWidget {
  const HomeBalanceCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = ref.watch(homeControllerProvider.select((s) => s.balance));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Your Balance', style: TextStyle(color: AppColors.textSecondary)),
        const SizedBox(height: 6),
        Text(
          '\$${balance.toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
