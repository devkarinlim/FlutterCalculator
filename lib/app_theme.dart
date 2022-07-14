import 'package:flutter/material.dart';

class AppTheme{
  static var white;

  //size
    static Size size(BuildContext context) => MediaQuery.of(context).size;
    static const double buttonHeight = 60;
    static const FontWeight buttonTitleWeight = FontWeight.normal;
    static const String buttonFontFamily = "SFProText";

    //colors
    static Color orange = const Color(0xFFfd9500);
    static Color lightGrey = const Color(0xFFa6a6a5);
    static Color darkGrey = const Color(0xFF333333);
    static Color backgroundColor = const Color(0xFF000000);
    static Color darkTintColor = const Color(0xFF020202);
    static Color lightTintColor = const Color(0xFFFFFFFF);

}