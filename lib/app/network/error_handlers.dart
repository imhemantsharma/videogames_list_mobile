import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:videogames_list_mobile/app/network/exceptions/api_exception.dart';
import 'package:videogames_list_mobile/app/network/exceptions/app_exception.dart';
import 'package:videogames_list_mobile/app/network/exceptions/not_found_exception.dart';
import 'package:videogames_list_mobile/app/network/exceptions/service_unavailable_exception.dart';

Exception handleError(String error) {
  if (kDebugMode) {
    print("Generic exception: $error");
  }

  return AppException(message: error);
}

Exception handleDioError(DioException dioError) {
  switch (dioError.type) {
    case DioExceptionType.cancel:
      return AppException(message: "Request to API server was cancelled");
    case DioExceptionType.connectionTimeout:
      return AppException(message: "Connection timeout with API server");
    case DioExceptionType.receiveTimeout:
      return TimeoutException("Receive timeout in connection with API server");
    case DioExceptionType.sendTimeout:
      return TimeoutException("Send timeout in connection with API server");
    case DioExceptionType.badResponse:
      return _parseDioErrorResponse(dioError);
    case DioExceptionType.badCertificate:
      return AppException(message: "Invalid certificate");
    case DioExceptionType.connectionError:
    case DioExceptionType.unknown:
      return AppException(message: "Something went wrong, Please try again after sometime.");
  }
}

Exception _parseDioErrorResponse(DioException dioError) {
  int statusCode = dioError.response?.statusCode ?? -1;
  String? status;
  String? serverMessage;

  try {
    if (statusCode == -1 || statusCode == HttpStatus.ok) {
      statusCode = dioError.response?.data["statusCode"];
    }
    status = dioError.response?.data["status"];
    serverMessage = dioError.response?.data["error"];
  } catch (e, s) {
    if (kDebugMode) {
      print("$e");
      print(s.toString());
    }

    serverMessage = "Something went wrong. Please try again later.";
  }

  switch (statusCode) {
    case HttpStatus.serviceUnavailable:
      return ServiceUnavailableException("Service Temporarily Unavailable");
    case HttpStatus.notFound:
      return NotFoundException(serverMessage ?? "", status ?? "");
    default:
      return ApiException(
          httpCode: statusCode,
          status: status ?? "",
          message: serverMessage ?? "");
  }
}
