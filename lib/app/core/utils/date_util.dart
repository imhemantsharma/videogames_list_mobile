import 'package:intl/intl.dart';

class DateUtil {
  /// Private constructor for avoiding object creation
  DateUtil._();

  static const String yMMDDash = 'yyyy-MM-dd';

  static String getDefaultFormattedDate(String? date) {
    try {
      return DateFormat.yMMMMd().format(
          (date?.isEmpty ?? true) ? DateTime.now() : DateTime.parse(date!));
    } catch (_) {
      return date ?? '';
    }
  }

  static String getTodayDate(
      {String? dateFormat,
      int subtractYear = 0,
      int subtractMonth = 0,
      int subtractDay = 0}) {
    if (subtractYear < 0) {
      subtractYear = 0;
    }
    if (subtractMonth < 0) {
      subtractMonth = 0;
    }
    if (subtractDay < 0) {
      subtractDay = 0;
    }

    DateTime today = DateTime.now();
    DateTime newDate = DateTime(
        today.year - subtractYear,
        today.month - subtractMonth,
        today.day - subtractDay,
        today.hour,
        today.minute,
        today.second,
        today.millisecond,
        today.microsecond);
    return DateFormat(dateFormat).format(newDate);
  }
}
