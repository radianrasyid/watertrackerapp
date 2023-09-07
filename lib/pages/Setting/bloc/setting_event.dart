part of 'setting_bloc.dart';

@immutable
sealed class SettingEvent {}

class CalendarFocusDayChangeEvent extends SettingEvent {
  final DateTime focusedDay;

  CalendarFocusDayChangeEvent({required this.focusedDay});
}

class CalendarSelectedDayChangeEvent extends SettingEvent {
  final DateTime selectedDay;

  CalendarSelectedDayChangeEvent({required this.selectedDay});
}
