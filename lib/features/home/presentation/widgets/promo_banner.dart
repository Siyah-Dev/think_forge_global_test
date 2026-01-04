import 'package:flutter/material.dart';
import 'package:trading_app/core/theme/app_colors.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/icons/banner_image.png'),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: 0.65,
        child: Column(
          spacing: 3,
          crossAxisAlignment: .start,
          children: [
            const Text(
              'Ring in the New Year with amazing savings!🎉 '
              'Everything you love is now at year-end prices.',
              softWrap: true,
              maxLines: null,
              style: TextStyle(
                color: AppColors.background,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
            Text('Click the banner to learn more'),
          ],
        ),
      ),
    );
  }
}
