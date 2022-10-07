import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:videogames_list_mobile/generated/l10n.dart';

abstract class INetworkInfoProvider {
  RxBool get isNetworkConnected;
}

class NetworkController extends GetxController implements INetworkInfoProvider {
  /// Network check
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  RxBool isNetworkConnected = true.obs;

  @override
  void onInit() async {
    super.onInit();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void onClose() async {
    super.onClose();
    _connectivitySubscription.cancel();
  }

  /// Check init connection & check connection
  Future<void> initConnectivity() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('PlatformException Error${e.stacktrace}');
      }
    }
  }

  /// Listen network changes
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        isNetworkConnected.value = true;
        break;

      default:
        isNetworkConnected.value = false;
        break;
    }
  }

  /// Check network is connected
  ///
  /// If network is connected then return bool status
  /// otherwise show snack-bar
  bool hasNetworkConnected() {
    if (!isNetworkConnected.value) {
      ScaffoldMessenger.of(Get.context as BuildContext).showSnackBar(
        SnackBar(
          content: Text(S.of(Get.context as BuildContext).noNetworkMessage),
          duration: const Duration(seconds: 2),
          action: null,
        ),
      );
    }
    return isNetworkConnected.value;
  }
}
