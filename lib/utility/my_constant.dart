import 'package:flutter/material.dart';

class MyConstant {
  static Color primary = const Color.fromARGB(255, 61, 80, 188);
  static Color dark = Colors.black;

  BoxDecoration bgBox() => BoxDecoration(
        color: primary,
      );

  TextStyle h1Style() => TextStyle(
        fontSize: 36,
        color: dark,
        fontWeight: FontWeight.bold,
      );

  TextStyle h2Style() => TextStyle(
        fontSize: 20,
        color: dark,
        fontWeight: FontWeight.w500,
      );

  TextStyle h2WhiteStyle() => const TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      );

       TextStyle h2RedStyle() => const TextStyle(
        fontSize: 20,
        color: Colors.red,
        fontWeight: FontWeight.w500,
      );

  TextStyle h3Style() => TextStyle(
        fontSize: 14,
        color: dark,
        fontWeight: FontWeight.normal,
      );
}
