import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:videogames_list_mobile/app/network/pretty_dio_logger.dart';
import 'package:videogames_list_mobile/app/network/request_headers.dart';

class DioProvider {
  static const String baseUrl = 'https://api.rawg.io/api/';
  static const String apiKey = '{Add_API_KEY_HERE}';

  static Dio? _instance;

  static const int _maxLineWidth = 90;
  static final _prettyDioLogger = PrettyDioLogger(
      requestHeader: kDebugMode,
      requestBody: kDebugMode,
      responseBody: kDebugMode,
      responseHeader: false,
      error: kDebugMode,
      compact: kDebugMode,
      maxWidth: _maxLineWidth);

  static final BaseOptions _options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(minutes: 1),
    receiveTimeout: const Duration(minutes: 1),
  );

  static Dio get httpDio {
    if (_instance == null) {
      _instance = Dio(_options);

      if (kDebugMode) {
        _instance!.interceptors.add(_prettyDioLogger);
      }

      return _instance!;
    } else {
      _instance!.interceptors.clear();

      if (kDebugMode) {
        _instance!.interceptors.add(_prettyDioLogger);
      }

      return _instance!;
    }
  }

  ///returns a Dio client with Access token in header
  static Dio get tokenClient {
    _addInterceptors();

    return _instance!;
  }

  ///returns a Dio client with Access token in header
  ///Also adds a token refresh interceptor which retry the request when it's unauthorized
  static Dio get dioWithHeaderToken {
    _addInterceptors();

    return _instance!;
  }

  static _addInterceptors() {
    _instance ??= httpDio;
    _instance!.interceptors.clear();
    _instance!.interceptors.add(RequestHeaderInterceptor());
    _instance!.interceptors.add(_prettyDioLogger);
  }

  DioProvider.setContentTypeApplicationJson() {
    _instance?.options.contentType = "application/json";
  }
}
