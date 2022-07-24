import 'package:flutter/material.dart';

class ColorManager {
  //Colors without opacity
  static Color primary = HexColor.getColorFromHex('#ED9728');
  static Color darkGrey = HexColor.getColorFromHex('#525252');
  static Color grey = HexColor.getColorFromHex('#737477');
  static Color lightGrey = HexColor.getColorFromHex('#9E9E9E');
  static Color darkPrimary = HexColor.getColorFromHex('#D17D11');
  static Color grey1 = HexColor.getColorFromHex('#707070');
  static Color grey2 = HexColor.getColorFromHex('#797979');
  static Color white = HexColor.getColorFromHex('#FFFFFF');
  static Color error = HexColor.getColorFromHex('#e61f34');

  //Opacity colors
  static Color primaryOpacity70 = HexColor.getColorFromHex('#B3ED9728');
}

extension HexColor on Color {
  static Color getColorFromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString';
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
