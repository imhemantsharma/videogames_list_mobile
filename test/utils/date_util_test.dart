
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:videogames_list_mobile/app/core/utils/date_util.dart';

void main() {

  test('Valid date format test', () {
    String date = DateUtil.getDefaultFormattedDate(null);
    expect(date, DateFormat.yMMMMd().format(DateTime.now()));

    date = DateUtil.getDefaultFormattedDate('');
    expect(date, DateFormat.yMMMMd().format(DateTime.now()));

    date = DateUtil.getDefaultFormattedDate("2022-10-09");
    expect(date, 'October 9, 2022');
  });

  test('Invalid date format test', () {
    String date = DateUtil.getDefaultFormattedDate("2022/10/09");
    expect(date, '2022/10/09');

    date = DateUtil.getDefaultFormattedDate("09-10-2022");
    expect(date, '09-10-2022');

    date = DateUtil.getDefaultFormattedDate("12-21-2022");
    expect(date, '12-21-2022');
  });

}