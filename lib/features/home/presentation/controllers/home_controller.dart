import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trading_app/features/home/data/models/chart_data.dart';
import 'home_state.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController() : super(HomeState.initial());
  void changeFilter(TimeFilter filter) {
    switch (filter) {
      case TimeFilter.week:
        state = state.copyWith(
          filter: filter,
          chartData: const [
            ChartData(label: 'Mon', referral: 20, bonus: 10),
            ChartData(label: 'Tue', referral: 35, bonus: 18),
            ChartData(label: 'Wed', referral: 30, bonus: 12),
            ChartData(label: 'Thu', referral: 45, bonus: 20),
          ],
        );
        break;

      case TimeFilter.month:
        state = state.copyWith(
          filter: filter,
          chartData: const [
            ChartData(label: 'Jun', referral: 120, bonus: 80),
            ChartData(label: 'Jul', referral: 90, bonus: 50),
            ChartData(label: 'Aug', referral: 140, bonus: 100),
            ChartData(label: 'Sep', referral: 160, bonus: 130),
          ],
        );
        break;

      case TimeFilter.year:
        state = state.copyWith(
          filter: filter,
          chartData: const [
            ChartData(label: '2022', referral: 800, bonus: 300),
            ChartData(label: '2023', referral: 1100, bonus: 450),
            ChartData(label: '2024', referral: 1450, bonus: 600),
            ChartData(label: '2025', referral: 1800, bonus: 820),
          ],
        );
        break;
    }
  }
}

final homeControllerProvider = StateNotifierProvider<HomeController, HomeState>(
  (ref) => HomeController(),
);
