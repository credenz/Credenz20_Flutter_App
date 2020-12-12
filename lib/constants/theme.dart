import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

TextStyle listTitleDefaultTextStyle = TextStyle(color: Colors.white70, fontSize: 13.0, fontWeight: FontWeight.w600);
TextStyle listTitleSelectedTextStyle = TextStyle(color: Colors.white, fontSize: 13.0, fontWeight: FontWeight.w600);

Color selectedColor = Color(0xFF4ACBEA);
Color drawerBackgroundColor = Color(0xff000000);

final loader=SpinKitThreeBounce(
  color: drawerBackgroundColor,
  size: 30,
);