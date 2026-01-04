import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import '../../../../core/theme/app_colors.dart';

class ScrollingBanner extends StatelessWidget {
  const ScrollingBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: double.infinity,
      color: AppColors.secondary, // green banner
      child: Marquee(
        text:
            '⬇️ Withdrawals • 🔐 Secure Trading Wallet • ⚡ Instant Deposits • 🚀 Fast Withdrawals •',
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
        scrollAxis: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        velocity: 40.0,
        blankSpace: 40.0,
        startPadding: 16.0,
        accelerationDuration: const Duration(seconds: 1),
        decelerationDuration: const Duration(seconds: 1),
        pauseAfterRound: const Duration(seconds: 0),
        showFadingOnlyWhenScrolling: false,
        fadingEdgeStartFraction: 0.0,
        fadingEdgeEndFraction: 0.0,
      ),
    );
  }
}
