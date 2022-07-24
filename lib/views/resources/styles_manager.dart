import 'package:flutter/cupertino.dart';
import 'package:tut_project/views/resources/font_manager.dart';

TextStyle _getTextStyle(String fontFamily, double fontSize,
    FontWeight fontWeight, Color fontColor) {
  return TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: fontColor,
  );
}

// bold style

TextStyle getBoldStyle(
    {double fontSize = FontSize.s12, required Color fontColor}) {
  return _getTextStyle(
    FontConstants.fontFamily,
    fontSize,
    FontWeightManager.bold,
    fontColor,
  );
}

// semi-bold style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color fontColor}) {
  return _getTextStyle(
    FontConstants.fontFamily,
    fontSize,
    FontWeightManager.semiBold,
    fontColor,
  );
}

// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color fontColor}) {
  return _getTextStyle(
    FontConstants.fontFamily,
    fontSize,
    FontWeightManager.medium,
    fontColor,
  );
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color fontColor}) {
  return _getTextStyle(
    FontConstants.fontFamily,
    fontSize,
    FontWeightManager.regular,
    fontColor,
  );
}

// light style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color fontColor}) {
  return _getTextStyle(
    FontConstants.fontFamily,
    fontSize,
    FontWeightManager.light,
    fontColor,
  );
}
