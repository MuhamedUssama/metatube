import 'package:flutter/material.dart';

abstract class AppTheme {
  static const Color dark = Color(0xff1e1e1e);
  static const Color medium = Color(0x50ffffff);
  static const Color accent = Color(0xffffa500);

  static const Color disableBackgroundColor = Colors.black12;
  static const Color disableForegroundColor = Colors.white12;

  // static ElevatedButtonThemeData elevatedButtonThemeData =
  //     ElevatedButtonThemeData(
  //   style: ButtonStyle(
  //     backgroundColor: MaterialStateProperty.all<Color>(accent),
  //   ),
  // );
}
