import 'package:bank_test/presentation/resources/color_manager.dart';
import 'package:bank_test/presentation/resources/font_manager.dart';
import 'package:flutter/material.dart';

extension ShowSnackbar on BuildContext {
  void showSnackbar({
    required String message,
    required GlobalKey<ScaffoldMessengerState> key,
  }) {
    key.currentState!.showSnackBar(
      SnackBar(
        content: Row(
          children: <Widget>[
            Icon(
              Icons.info_outline,
              color: ColorManager.primary,
              size: 25,
            ),
            const SizedBox(
              width: 15,
            ),
            Flexible(
              child: Text(
                message,
                style: TextStyle(
                  color: ColorManager.grey,
                  fontSize: FontSizeManager.s12,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: ColorManager.white,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void showSnackbarConnectivity({
    required String message,
    required BuildContext context,
    required GlobalKey<ScaffoldMessengerState> key,
  }) {
    key.currentState!.showSnackBar(
      SnackBar(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.wifi_off,
                color: ColorManager.primary,
                size: 20,
              ),
              const SizedBox(
                width: 15,
              ),
              Flexible(
                child: Text(
                  message,
                  style: TextStyle(
                    color: ColorManager.grey,
                    fontSize: FontSizeManager.s12,
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: ColorManager.white,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void showSuccessSnackbar({
    required String message,
    required GlobalKey<ScaffoldMessengerState> key,
  }) {
    key.currentState!.showSnackBar(
      SnackBar(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
          child: Row(
            children: <Widget>[
              Container(
                decoration: ShapeDecoration(
                  color: ColorManager.white,
                  shape: CircleBorder(
                    side: BorderSide(
                      width: 2,
                      color: ColorManager.success,
                    ),
                  ),
                ),
                child: Icon(
                  Icons.done,
                  color: ColorManager.success,
                  size: 20,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                child: Text(
                  message,
                  style: TextStyle(
                    color: ColorManager.grey,
                    fontSize: FontSizeManager.s12,
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: ColorManager.white,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void showErrorSnackbar({
    required String message,
    required GlobalKey<ScaffoldMessengerState> key,
  }) {
    key.currentState!.showSnackBar(
      SnackBar(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.warning_amber,
                color: ColorManager.error,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text(
                  message,
                  style: TextStyle(
                    color: ColorManager.grey,
                    fontSize: FontSizeManager.s12,
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: ColorManager.white,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
