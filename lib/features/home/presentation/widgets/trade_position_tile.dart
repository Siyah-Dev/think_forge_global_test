import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

enum TradeType { buy, sell }

class TradePositionTile extends StatelessWidget {
  final TradeType type;
  final String symbol;
  final double pnl;
  final double sl;
  final double tp;
  final String lotInfo;

  const TradePositionTile({
    super.key,
    required this.type,
    required this.symbol,
    required this.pnl,
    required this.sl,
    required this.tp,
    required this.lotInfo,
  });

  bool get isBuy => type == TradeType.buy;

  @override
  Widget build(BuildContext context) {
    final pnlColor = pnl >= 0 ? AppColors.success : AppColors.error;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.textSecondary.withAlpha(40),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              isBuy ? 'Buy' : 'Sell',
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  symbol,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'SL : \$${sl.toStringAsFixed(2)}   TP : +\$${tp.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${pnl >= 0 ? '+' : '-'}\$${pnl.abs().toStringAsFixed(2)}',
                style: TextStyle(
                  color: pnlColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                lotInfo,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
