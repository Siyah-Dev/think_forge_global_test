import 'package:trading_app/features/home/data/models/chart_data.dart';

enum TimeFilter { week, month, year }

class HomeState {
  final double balance;
  final double monthlyTransactions;
  final double referralAmount;
  final double bonusAmount;

  final TimeFilter filter;
  final List<ChartData> chartData;

  const HomeState({
    required this.balance,
    required this.monthlyTransactions,
    required this.referralAmount,
    required this.bonusAmount,
    required this.filter,
    required this.chartData,
  });

  factory HomeState.initial() {
    return const HomeState(
      balance: 5231.89,
      monthlyTransactions: 556.89,
      referralAmount: 105.89,
      bonusAmount: 56.89,
      filter: TimeFilter.month,
      chartData: [
        ChartData(label: 'Jun', referral: 120, bonus: 80),
        ChartData(label: 'Jul', referral: 90, bonus: 50),
        ChartData(label: 'Aug', referral: 140, bonus: 100),
        ChartData(label: 'Sep', referral: 160, bonus: 130),
      ],
    );
  }

  HomeState copyWith({
    double? balance,
    double? monthlyTransactions,
    double? referralAmount,
    double? bonusAmount,
    TimeFilter? filter,
    List<ChartData>? chartData,
  }) {
    return HomeState(
      balance: balance ?? this.balance,
      monthlyTransactions: monthlyTransactions ?? this.monthlyTransactions,
      referralAmount: referralAmount ?? this.referralAmount,
      bonusAmount: bonusAmount ?? this.bonusAmount,
      filter: filter ?? this.filter,
      chartData: chartData ?? this.chartData,
    );
  }
}
