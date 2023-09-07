import 'package:intl/intl.dart';

class DateProcessors {
  static List<Map<String, dynamic>> getWeekDaysAndDates() {
    final today = DateTime.now();
    final monday = today.subtract(Duration(
        days: today.weekday -
            1)); // Get the first day of the current week (Monday).

    final List<Map<String, dynamic>> weekData = [];

    for (int i = 0; i < 7; i++) {
      final currentDate = monday.add(Duration(days: i));
      weekData.add({
        'day': DateFormat.E().format(currentDate),
        'date': DateTime.parse(currentDate.toString()),
      });
    }

    return weekData;
  }
}
