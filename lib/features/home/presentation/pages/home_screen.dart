import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trading_app/features/home/presentation/widgets/home_balance_card.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/action_buttons.dart';
import '../widgets/promo_banner.dart';
import '../widgets/transaction_overview_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isTablet = constraints.maxWidth > 600;

            return ListView(
              padding: EdgeInsets.all(isTablet ? 32 : 16),
              children: const [
                HomeAppBar(),
                SizedBox(height: 20),
                HomeBalanceCard(),
                SizedBox(height: 16),
                ActionButtons(),
                SizedBox(height: 20),
                PromoBanner(),
                SizedBox(height: 20),
                TransactionOverviewCard(),
              ],
            );
          },
        ),
      ),
    );
  }
}
