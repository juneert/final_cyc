import 'package:flutter/material.dart';

class Myconstast {
  static Color darkColor = const Color(0xff6d1163);
  static Color primaryColor = const Color(0xffd173c2);
  static Color lightColor = const Color(0xfffff7ff);
  static Color textColor = const Color.fromARGB(255, 0, 0, 0);
  static Color bgColor = const Color(0xffdfdeff);

  static var timeServiceCars = <String>[
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
  ];

  static var timeServiceMotos = <String>[
    '08:00',
    '08:30',
    '09:00',
    '09:30',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',

  ];

  TextStyle h1Style() => TextStyle(
        color: textColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      );

  TextStyle h2Style() => TextStyle(
        color: textColor,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      );
    
   TextStyle h2blueStyle() => const TextStyle(
        color: Colors.blue,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      );

  TextStyle h3Style() => TextStyle(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      );
}
