import 'package:flutter/material.dart';

class ColorManager {
  //Colors without opacity
  static Color primary = const Color(0xFFED9728);
  static Color darkGrey = const Color(0xFF525252);
  static Color grey = const Color(0xFF737477);
  static Color lightGrey = const Color(0xFF9E9E9E);
  static Color darkPrimary = const Color(0xFFD17D11);
  static Color grey1 = const Color(0xFF707070);
  static Color grey2 = const Color(0xFF797979);
  static Color white = const Color(0xFFFFFFFF);
  static Color error = const Color(0xFFe61f34);

  //Opacity colors
  static Color primaryOpacity70 = const Color(0xB3ED9728);
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
