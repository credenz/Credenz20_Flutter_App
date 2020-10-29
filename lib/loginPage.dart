import 'package:credenz20/SignUp.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(child: Text('SignUp'),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SignUp()));
      },),
    );
  }
}
