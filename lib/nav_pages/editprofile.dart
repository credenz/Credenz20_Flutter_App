import 'file:///C:/Users/asus/Documents/GitHub/Credenz20_Flutter_App/lib/constants/theme.dart';
import 'package:flutter/material.dart';
class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: drawerBackgroundColor,
        title: Text("Edit Profile"),
      ),
    );
  }
}
