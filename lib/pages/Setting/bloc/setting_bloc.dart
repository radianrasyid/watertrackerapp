import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:watertrackerapp/utils/processors/date_processors.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc()
      : super(
            CalendarInitial(dateList: DateProcessors.getWeekDaysAndDates())) {}
}
