import 'package:bank_test/presentation/resources/color_manager.dart';
import 'package:bank_test/presentation/resources/font_manager.dart';
import 'package:bank_test/presentation/resources/styles_manager.dart';
import 'package:bank_test/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // Main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.primaryOpacity70,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: ColorManager.grey,
    ),
    // Card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),
    // AppBar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.primaryOpacity70,
      titleTextStyle: getRegularStyle(
        color: ColorManager.white,
        fontSize: FontSizeManager.s16,
      ),
    ),
    // Button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primaryOpacity70,
    ),
    // Elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.white),
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
      ),
    ),
    // Text theme
    textTheme: TextTheme(
      headline1: getSemiBoldStyle(
        color: ColorManager.darkGrey,
        fontSize: AppSize.s16,
      ),
      subtitle1: getMediumStyle(
        color: ColorManager.lightGrey,
        fontSize: AppSize.s14,
      ),
      caption: getRegularStyle(color: ColorManager.grey1),
      bodyText1: getRegularStyle(color: ColorManager.grey),
    ),
    // InputDecoration theme (textFormField)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(color: ColorManager.grey1),
      labelStyle: getMediumStyle(color: ColorManager.darkGrey),
      errorStyle: getRegularStyle(color: ColorManager.error),
      // Enable border
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.lightGrey,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      // Focused border
      iconColor: ColorManager.primaryOpacity70,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      // Error border
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.error,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      // Focus Error border
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
    ),
  );
}
