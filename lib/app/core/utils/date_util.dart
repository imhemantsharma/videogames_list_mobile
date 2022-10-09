import 'package:intl/intl.dart';

class DateUtil {
  /// Private constructor for avoiding object creation
  DateUtil._();

  static String getDefaultFormattedDate(String? date) {
    try {
      return DateFormat.yMMMMd().format(
          (date?.isEmpty ?? true) ? DateTime.now() : DateTime.parse(date!));
    } catch (_) {
      return date ?? '';
    }
  }
}
