/// State class for bottom navigation
class BottomNavState {
  final int selectedIndex;
  final String currentRoute;

  const BottomNavState({
    required this.selectedIndex,
    required this.currentRoute,
  });

  BottomNavState copyWith({
    int? selectedIndex,
    String? currentRoute,
  }) {
    return BottomNavState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      currentRoute: currentRoute ?? this.currentRoute,
    );
  }
}

