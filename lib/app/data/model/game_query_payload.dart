import 'package:videogames_list_mobile/app/core/values/app_values.dart';
import 'package:videogames_list_mobile/app/network/dio_provider.dart';

class GameQueryPayload {
  GameQueryPayload(
      {this.page = 1,
      this.pageSize = AppValues.paginationDefaultLimit,
      this.platforms = 187,
      this.dates = "2021-10-07,2022-10-07",
      this.ordering = "released",
      this.key = DioProvider.apiKey});

  num page;
  num pageSize;
  num platforms;
  String dates;
  String ordering;
  String key;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['page_size'] = pageSize;
    map['platforms'] = platforms;
    map['dates'] = dates;
    map['ordering'] = ordering;
    map['key'] = key;
    return map;
  }
}
