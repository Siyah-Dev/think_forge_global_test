import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trading_app/features/home/presentation/controllers/home_controller.dart';
import 'package:trading_app/features/home/presentation/controllers/home_state.dart';
import '../../../../core/theme/app_colors.dart';

class TimeFilterTabs extends ConsumerWidget {
  const TimeFilterTabs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeControllerProvider);
    final controller = ref.read(homeControllerProvider.notifier);

    Widget buildTab(String label, TimeFilter filter) {
      final isActive = state.filter == filter;

      return GestureDetector(
        onTap: () => controller.changeFilter(filter),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isActive ? AppColors.surface : AppColors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isActive ? AppColors.textPrimary : AppColors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    }

    return Row(
      children: [
        buildTab('W', TimeFilter.week),
        const SizedBox(width: 8),
        buildTab('M', TimeFilter.month),
        const SizedBox(width: 8),
        buildTab('Y', TimeFilter.year),
      ],
    );
  }
}
