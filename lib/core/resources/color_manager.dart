import 'package:flutter/material.dart';

class ColorManager {
  static const Color primaryColor = Color.fromRGBO(84, 48, 0, 1);
  static final primarySwatchColor = MaterialColor(
    mintGreen.value,
    const {
      50: Color(0xffECF4E9),
      100: Color(0xffD0E4C7),
      200: Color(0xffB1D3A2),
      300: Color(0xff92C17C),
      400: Color(0xff7AB360),
      500: Color(0xff63A644),
      600: Color(0xff519535),
      700: Color(0xff478B2D),
      800: Color(0xff478B2D),
      900: Color(0xff357B1F),
    },
  );
  static const Color black = Color(0xff000000);
  static const Color blackGrey = Color(0xff333333);
  static const Color white = Color(0xffffffff);
  static const Color mintGreen = Color(0xff63a644);
  static const Color green = Color(0xff146232);
  static const Color lightGreen = Color(0xffc3d970);
  static const Color grey = Color(0xffcccccc);
  static const Color greyWithOpacity = Color(0xfff2f2f2);
  static const Color error = Color(0xffFF0000);
}
