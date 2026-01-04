import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trading_app/features/home/presentation/controllers/home_controller.dart';
import '../../../../core/theme/app_colors.dart';

class TradingTips extends ConsumerWidget {
  const TradingTips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tips = ref.watch(
      homeControllerProvider.select((state) => state.tradingTips),
    );
    final currentIndex = ref.watch(
      homeControllerProvider.select((state) => state.tradingTipCurrentIndex),
    );
    final controller = ref.read(homeControllerProvider.notifier);

    return Container(
      height: 320,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0F3D2E), AppColors.background],
        ),
        border: Border.all(color: AppColors.textSecondary.withAlpha(40)),
      ),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: PageController(initialPage: currentIndex),
              onPageChanged: controller.onPageChanged,
              itemCount: tips.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Text(
                    tips[currentIndex],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18,
                      height: 1.4,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            'Trading Tips',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              tips.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 8,
                width: currentIndex == index ? 18 : 8,
                decoration: BoxDecoration(
                  color: currentIndex == index
                      ? AppColors.secondary
                      : AppColors.secondary.withAlpha(80),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
