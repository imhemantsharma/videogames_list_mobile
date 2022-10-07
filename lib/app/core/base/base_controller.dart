import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:videogames_list_mobile/app/network/exceptions/api_exception.dart';
import 'package:videogames_list_mobile/app/network/exceptions/app_exception.dart';
import 'package:videogames_list_mobile/app/network/exceptions/json_format_exception.dart';
import 'package:videogames_list_mobile/app/network/exceptions/network_exception.dart';
import 'package:videogames_list_mobile/app/network/exceptions/not_found_exception.dart';
import 'package:videogames_list_mobile/app/network/exceptions/service_unavailable_exception.dart';
import 'package:videogames_list_mobile/app/network/exceptions/unauthorize_exception.dart';
import 'package:videogames_list_mobile/app/network/network_controller.dart';
import 'package:videogames_list_mobile/generated/l10n.dart';

abstract class BaseController extends GetxController {
  /// Network check
  final INetworkInfoProvider networkController = Get.find();

  dynamic callDataService<T>(
    Future<T> future, {
    Function(String message)? onNetworkError,
    Function? onStart,
    Function(T response)? onSuccess,
    Function(Exception exception)? onError,
    Function? onComplete,
  }) async {
    if (!networkController.isNetworkConnected.value) {
      if (onNetworkError != null) {
        onNetworkError(S.of(Get.context!).noNetworkMessage);
      }
      return;
    }

    Exception? exceptionObj;

    if (onStart != null) onStart();
    try {
      final T response = await future;

      if (onSuccess != null) onSuccess(response);

      if (onComplete != null) onComplete();

      return response;
    } on ServiceUnavailableException catch (exception) {
      exceptionObj = exception;
    } on UnauthorizedException catch (exception) {
      exceptionObj = exception;
    } on TimeoutException catch (exception) {
      exceptionObj = exception;
    } on NetworkException catch (exception) {
      exceptionObj = exception;
    } on JsonFormatException catch (exception) {
      exceptionObj = exception;
    } on NotFoundException catch (exception) {
      exceptionObj = exception;
    } on ApiException catch (exception) {
      exceptionObj = exception;
    } on AppException catch (exception) {
      exceptionObj = exception;
    } catch (error) {
      exceptionObj = AppException(message: "$error");
      if (kDebugMode) {
        print("Controller>>>>>> error $error");
      }
    }

    if (onError != null) onError(exceptionObj);

    if (onComplete != null) onComplete();
  }
}
