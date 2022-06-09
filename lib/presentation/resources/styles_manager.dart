import 'package:bank_test/presentation/resources/font_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(
  double fontSize,
  String fontFamily,
  FontWeight fontWeight,
  Color color,
) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color,
  );
}

// Regular Style
TextStyle getRegularStyle({
  double fontSize = FontSizeManager.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWeightManager.regular,
    color,
  );
}

// light Style
TextStyle getLightStyle({
  double fontSize = FontSizeManager.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWeightManager.light,
    color,
  );
}

// medium Style
TextStyle getMediumStyle({
  double fontSize = FontSizeManager.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWeightManager.medium,
    color,
  );
}

// semiBold Style
TextStyle getSemiBoldStyle({
  double fontSize = FontSizeManager.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWeightManager.semiBold,
    color,
  );
}

// semiBold Style
TextStyle getBoldStyle({
  double fontSize = FontSizeManager.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWeightManager.bold,
    color,
  );
}
