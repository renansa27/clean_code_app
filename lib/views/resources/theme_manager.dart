import 'package:flutter/material.dart';
import 'package:tut_project/views/resources/color_manager.dart';
import 'package:tut_project/views/resources/font_manager.dart';
import 'package:tut_project/views/resources/styles_manager.dart';
import 'package:tut_project/views/resources/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // Main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorDark: ColorManager.darkPrimary,
    primaryColorLight: ColorManager.primaryOpacity70,
    disabledColor: ColorManager.grey1, // used in case of disabled state
    // Ripple color
    splashColor: ColorManager.primaryOpacity70,
    // AccentColor
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: ColorManager.grey,
    ),
    // Card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    // App bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.primaryOpacity70,
      titleTextStyle: getRegularStyle(
        fontColor: ColorManager.white,
        fontSize: FontSize.s16,
      ),
    ),
    // Button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primaryOpacity70,
    ),
    // Elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: getRegularStyle(fontColor: ColorManager.white),
          primary: ColorManager.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppSize.s12,
            ),
          )),
    ),
    // Text theme
    textTheme: TextTheme(
      headline1: getSemiBoldStyle(
          fontColor: ColorManager.darkGrey, fontSize: FontSize.s16),
      subtitle1: getMediumStyle(
          fontColor: ColorManager.lightGrey, fontSize: FontSize.s14),
      caption: getRegularStyle(
          fontColor: ColorManager.grey1, fontSize: FontSize.s12),
      bodyText1:
          getRegularStyle(fontColor: ColorManager.grey, fontSize: FontSize.s12),
    ),
    //Input decoration Theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(
        AppPadding.p8,
      ),
      // Hint style
      hintStyle: getRegularStyle(fontColor: ColorManager.grey1),
      // Label style
      labelStyle: getRegularStyle(fontColor: ColorManager.darkGrey),
      // Error style
      errorStyle: getRegularStyle(fontColor: ColorManager.error),
      // Enable border
      enabledBorder: _getInputDecorationBorder(color: ColorManager.grey),
      // Focused Border
      focusedBorder: _getInputDecorationBorder(color: ColorManager.primary),
      // Error border
      errorBorder: _getInputDecorationBorder(color: ColorManager.error),
      // Focused error border
      focusedErrorBorder:
          _getInputDecorationBorder(color: ColorManager.primary),
    ),
  );
}

InputBorder _getInputDecorationBorder({required Color color}) {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
    borderSide: BorderSide(color: color, width: AppSize.s1_5),
  );
}
