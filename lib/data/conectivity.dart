import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

@immutable
class Connection {
  static Future<bool> validateConnection() async {
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();

    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi;
  }
}
