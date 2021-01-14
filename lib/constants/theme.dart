import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

TextStyle listTitleDefaultTextStyle = TextStyle(
    color: Colors.white70, fontSize: 13.0, fontWeight: FontWeight.w600);
TextStyle listTitleSelectedTextStyle =
    TextStyle(color: Colors.white, fontSize: 13.0, fontWeight: FontWeight.w600);

Color selectedColor = Color(0xFF4ACBEA);
Color drawerBackgroundColor = Color(0xff000000);
Color primary = Color(0xFF121212);
Color notiBackColor = Color(0xff12173a);
Color dividerColor = Color(0xff152453);
Color textColor = Color(0xffeff2fd);
Color backColor = Color(0xff12173a);

List<Color> commonGradient = <Color>[Color(0xff21d6d4), Color(0xff0aa9d7)];
List<Color> backGradient = <Color>[Color(0xff21d6d4), Color(0xff0aa9d7)];
//12151e
final loader = SpinKitThreeBounce(
  color: drawerBackgroundColor,
  size: 30,
);

final animatedloader = SpinKitDoubleBounce(
  color: Color(0xff0c9e8f),
  size: 50,
);

final loader1 = SpinKitDoubleBounce(
  color: Color(0xff0c9e8f),
  size: 50,
);

final loader2 = SpinKitDoubleBounce(
  color: Color(0xff0c9e8f),
  size: 50,
);
