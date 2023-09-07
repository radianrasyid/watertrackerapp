part of 'bottom_nav_bar_bloc.dart';

@immutable
sealed class BottomNavBarEvent {}

class BottomNavBarEventChange extends BottomNavBarEvent {
  final int newIndex;

  BottomNavBarEventChange({this.newIndex = 0});
}
