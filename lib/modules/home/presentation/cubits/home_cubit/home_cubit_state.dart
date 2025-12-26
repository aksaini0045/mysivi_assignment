import 'package:equatable/equatable.dart';

class HomeCubitState extends Equatable {
  final int currentBottomIndex;
  final int currentTabBarIndex;

  const HomeCubitState({
    this.currentBottomIndex = 0,
    this.currentTabBarIndex = 0,
  });

  HomeCubitState copyWith({int? currentBottomIndex, int? currentTabBarIndex}) {
    return HomeCubitState(
      currentBottomIndex: currentBottomIndex ?? this.currentBottomIndex,
      currentTabBarIndex: currentTabBarIndex ?? this.currentTabBarIndex,
    );
  }

  @override
  List<Object?> get props => [currentBottomIndex, currentTabBarIndex];
}
