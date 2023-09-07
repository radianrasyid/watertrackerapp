part of 'setting_bloc.dart';

@immutable
sealed class SettingState {}

final class SettingInitial extends SettingState {}

final class CalendarInitial extends SettingState {
  final List<Map<String, dynamic>> dateList;

  CalendarInitial({required this.dateList});
}
