import 'package:flutter/material.dart';

const buttonColor1 = const Color(0xFFFFAFB1);
const fontColor1 = const Color(0xFF57B7EB);

const cleaningColor1 = const Color(0XFF84D2F4);
const cleaningColor2 = const Color(0XFF57B7EB);
const cleaningColor3 = const Color(0XFF6CC4EF);
const cookingColor1 = const Color(0XFFFBF392);
const cookingColor2 = const Color(0XFFF9EE64);
const nursingColor1 = const Color(0xFFFD8087);
const nursingColor2 = const Color(0XFFFE636E);

Map<int, Color> swatch = {
  50: Color.fromRGBO(87, 183, 235, .1),
  100: Color.fromRGBO(87, 183, 235, .2),
  200: Color.fromRGBO(87, 183, 235, .3),
  300: Color.fromRGBO(87, 183, 235, .4),
  400: Color.fromRGBO(87, 183, 235, .5),
  500: Color.fromRGBO(87, 183, 235, .6),
  600: Color.fromRGBO(87, 183, 235, .7),
  700: Color.fromRGBO(87, 183, 235, .8),
  800: Color.fromRGBO(87, 183, 235, .9),
  900: Color.fromRGBO(87, 183, 235, 1),
};

MaterialColor customSwatch = MaterialColor(0xFF57B7EB, swatch);
