import 'package:credenz20/theme.dart';
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
