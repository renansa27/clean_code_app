import 'package:flutter/material.dart';

abstract class ColorManager {
  //Colors without opacity
  static const primary = Color(0xFFED9728);
  static const darkGrey = Color(0xFF525252);
  static const grey = Color(0xFF737477);
  static const lightGrey = Color(0xFF9E9E9E);
  static const darkPrimary = Color(0xFFD17D11);
  static const grey1 = Color(0xFF707070);
  static const grey2 = Color(0xFF797979);
  static const white = Color(0xFFFFFFFF);
  static const error = Color(0xFFe61f34);
  static const arsenic = Color(0xFF36454F);

  //Opacity colors
  static const primaryOpacity70 = Color(0xB3ED9728);
}

/* extension HexColor on Color {
  static Color getColorFromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('0xFF', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString';
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
} */
