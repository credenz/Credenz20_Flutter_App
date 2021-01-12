import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

TextStyle listTitleDefaultTextStyle = TextStyle(color: Colors.white70, fontSize: 13.0, fontWeight: FontWeight.w600);
TextStyle listTitleSelectedTextStyle = TextStyle(color: Colors.white, fontSize: 13.0, fontWeight: FontWeight.w600);

Color selectedColor = Color(0xFF4ACBEA);
Color drawerBackgroundColor = Color(0xff000000);
Color primary= Color(0xFF0f1013);
Color notiBackColor = Color(0xff191d36);
Color dividerColor = Color(0xff313969);
Color textColor = Color(0xffcecddf);

final loader=SpinKitThreeBounce(
  color: drawerBackgroundColor,
  size: 30,
);

final animatedloader = SpinKitDoubleBounce(
  color: Color(0xff51F18B),
  size: 50,
);

final loader1=SpinKitDoubleBounce(
  color: Color(0xff51F18B),
  size: 50,
);

final loader2= SpinKitDoubleBounce(
  color: Color(0xff51F18B),
  size: 50,
);