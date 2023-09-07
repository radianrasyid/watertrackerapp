part of 'bottom_nav_bar_bloc.dart';

@immutable
sealed class BottomNavBarState {}

final class BottomNavBarInitial extends BottomNavBarState {
  final int indexedTab;

  BottomNavBarInitial({required this.indexedTab});

  BottomNavBarInitial copyWith({int? indexTab}) {
    return BottomNavBarInitial(indexedTab: indexTab ?? indexedTab);
  }
}
