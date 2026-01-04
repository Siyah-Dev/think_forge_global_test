import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trading_app/core/theme/app_colors.dart';
import 'package:trading_app/features/home/presentation/controllers/home_controller.dart';
import 'package:trading_app/features/home/presentation/widgets/bar_chart_widget.dart';
import 'package:trading_app/features/home/presentation/widgets/time_filter_button.dart';

class TransactionGraphWidget extends ConsumerWidget {
  const TransactionGraphWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chartData = ref.watch(
      homeControllerProvider.select((state) => state.chartData),
    );

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.textSecondary.withAlpha(60)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TimeFilterTabs(),

                const SizedBox(height: 12),

                const Text(
                  'Transactions (1M)',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
                const SizedBox(height: 4),
                const Text(
                  '\$556.89',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: BarChartWidget(data: chartData)),
        ],
      ),
    );
  }
}
