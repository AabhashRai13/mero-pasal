import 'package:flutter/material.dart';

class ColorManager {
  static Color kPrimaryColor = HexColor.fromHex("#FFD1DC");
  static Color kSecondaryColor = HexColor.fromHex("#CC8899");
  static Color kTextColor = HexColor.fromHex("#141619");

  static Color black = HexColor.fromHex("#141619");

  static Color kPrimaryLightColor = const Color(0xFFFFECDF);
  static const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
  );
// new colors
  static Color darkPrimary = HexColor.fromHex("#d17d11");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color greenIconColor = HexColor.fromHex("#47B14B");
  static Color bgWhite = HexColor.fromHex("#FCFCFC");
  static Color fontColorBlack = HexColor.fromHex("#1F2933");
  static Color error = HexColor.fromHex("#e61f34"); // red color
  static Color filledInputColorsForForm =
      HexColor.fromHex("#B0B8BF"); // red color

  static const Color colorTextFieldBorder = Color(0x1F000000);
  static const Color colorInputText = Color(0xBD000000);
  static const Color colorTextDescription = Color(0x82000000);
  static Color iconGrey = HexColor.fromHex("#9FA8B1");
  static Color fontColorLightHint = HexColor.fromHex("#7C84A0");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll("#", "");
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opactiy 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
