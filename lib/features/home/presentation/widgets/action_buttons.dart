import 'package:flutter/material.dart';
import 'package:trading_app/core/theme/app_colors.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _ActionButton(
          label: "Deposit",
          icon: Image.asset('assets/icons/deposit_icon.png', height: 20),
          backgroundColor: AppColors.textPrimary,
          forgroundColor: AppColors.background,
          onPressed: () {},
        ),
        const SizedBox(width: 12),
        _ActionButton(
          label: "Withdraw",
          icon: Image.asset('assets/icons/coins_hand.png', height: 20),
          backgroundColor: AppColors.textSecondary.withAlpha(60),
          forgroundColor: AppColors.textPrimary,
          onPressed: () {},
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.forgroundColor,
    required this.onPressed,
  });
  final String label;
  final Widget icon;
  final Color backgroundColor;
  final Color forgroundColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: forgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: .center,
          spacing: 8,
          children: [icon, Text(label)],
        ),
      ),
    );
  }
}
