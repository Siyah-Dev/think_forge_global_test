import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'pl_summary_item.dart';
import 'trade_position_tile.dart';

class OverallPLCard extends StatelessWidget {
  const OverallPLCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.textSecondary.withAlpha(40)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Overall P/L',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              PLSummaryItem(title: 'MT5 ID', value: 'MT51192'),
              PLSummaryItem(
                title: 'Floating pnl',
                value: '+\$200.00',
                valueColor: AppColors.success,
              ),
              PLSummaryItem(title: 'Open position', value: '22'),
            ],
          ),

          const SizedBox(height: 20),

          const TradePositionTile(
            type: TradeType.buy,
            symbol: 'USDXAU',
            pnl: 244.00,
            sl: 14.00,
            tp: 44.00,
            lotInfo: '\$10.00 × 2.47 lots',
          ),

          const SizedBox(height: 12),

          const TradePositionTile(
            type: TradeType.sell,
            symbol: 'USDXAU',
            pnl: -244.00,
            sl: 14.00,
            tp: 44.00,
            lotInfo: '\$10.00 × 2.47 lots',
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.textPrimary,
                foregroundColor: AppColors.background,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () {},
              child: const Text(
                'View All',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
