import 'package:intl/intl.dart';

class DateUtil {
  /// Private constructor for avoiding object creation
  DateUtil._();

  static String getDefaultFormattedDate(String? date) {
    return DateFormat.yMMMMd()
        .format(date != null ? DateTime.parse(date) : DateTime.now());
  }
}
