import 'package:flutter/material.dart';
import 'package:trading_app/features/home/presentation/widgets/transaction_graph_widget.dart';
import '../../../../core/theme/app_colors.dart';
import 'info_tile.dart';

class TransactionOverviewCard extends StatelessWidget {
  const TransactionOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.textSecondary.withAlpha(60),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Total Transactions Overview',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16),
          TransactionGraphWidget(),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: InfoTile(
                  icon: 'assets/icons/referal.png',
                  title: 'Referral',
                  value: '+\$105.89',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: InfoTile(
                  icon: 'assets/icons/bonus.png',
                  title: 'Bonus',
                  value: '+\$56.89',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
