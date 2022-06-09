import 'package:flutter/material.dart';
import 'package:bank_test/presentation/extension/snackbar_message.dart';

class SnackbarBuild {
  SnackbarBuild._();

  static GlobalKey<ScaffoldMessengerState> key =
      GlobalKey<ScaffoldMessengerState>();

  static void buildSnackbar(
    BuildContext context,
    String message,
  ) {
    context.showSnackbar(message: message, key: key);
  }

  static void buildConnectivitySnackbar(BuildContext context, String message) {
    context.showSnackbarConnectivity(
      message: message,
      context: context,
      key: key,
    );
  }

  static void buildSuccessSnackbar(
    BuildContext context,
    String message,
  ) {
    context.showSuccessSnackbar(message: message, key: key);
  }

  static void buildErrorSnackbar(BuildContext context, String message) {
    context.showErrorSnackbar(message: message, key: key);
  }
}
