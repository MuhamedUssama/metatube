import 'package:flutter/material.dart';

abstract class AppTheme {
  static const Color dark = Color(0xff1e1e1e);
  static const Color medium = Color(0x50ffffff);
  static const Color light = Color(0xffffffff);
  static const Color accent = Color(0xffffa500);

  static const Color disableBackgroundColor = Colors.black12;
  static const Color disableForegroundColor = Colors.white12;

  static const TextStyle inputTextStyle = TextStyle(color: light, fontSize: 20);
  static const TextStyle hintText = TextStyle(color: medium);
  static const TextStyle counterStyle = TextStyle(color: medium, fontSize: 14);

  // static ElevatedButtonThemeData elevatedButtonThemeData =
  //     ElevatedButtonThemeData(
  //   style: ButtonStyle(
  //     backgroundColor: MaterialStateProperty.all<Color>(accent),
  //   ),
  // );
}
