import 'package:flutter/material.dart';

class MyStyle {
  Color darkColor = const Color(0xff6d1163);
  Color primaryColor = const Color(0xffd173c2);
  Color lightColor = const Color(0xfffff7ff);

  Widget showProgess() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  TextStyle redBoldStyle() =>
      TextStyle(color: Colors.red.shade700, fontWeight: FontWeight.bold);

  Widget showLogo() => Image.asset('images/car1.png');

  Widget titleH1(String string) => Text(
        string,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      );

  Widget titleH2(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: darkColor,
        ),
      );

  Widget titleH2White(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      );

  Widget titleH3(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: darkColor,
        ),
      );

  Widget titleH3White(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 16,
          //fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      );

  MyStyle();
}
