import 'dart:convert';

import 'package:credenz20/constants/API.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'Home.dart';
import 'constants/styles.dart';
import 'constants/theme.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:credenz20/size_config.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;

  String name;
  String email;
  String collegeName;
  String password;
  String phoneNumber;
  String userName;
  final storage=FlutterSecureStorage();


  makeRequest()async{
    String url=signUpUrl;
    Map<String,String>headers={"Content-Type":"application/json"};
    String body='{"username":"$userName","name":"$name","password":"$password","email":"$email","phoneno":"$phoneNumber","clgname":"$collegeName"}';
    http.Response response=await http.post(url,body: body,headers: headers);
    print(url);
    print(body);
    print(response.body);
    print(response.statusCode);
    if(response.statusCode==200){
      await storage.write(key: "accToken", value:jsonDecode(response.body)['accessToken']);
      await storage.write(key: 'username', value: userName);
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Home(title: "Credenz \'20")));
    }else{
      String msg=jsonDecode(response.body)['message'];
      Fluttertoast.showToast(msg: msg.substring(0,1).toUpperCase()+msg.substring(1));
    }

  }


  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium =  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: drawerBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(70),
                ),
                Text(
                  "Greetings from PISB",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Enter your details",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height:getProportionateScreenHeight(10),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      style: textFieldStyle,
                      onChanged: (val){
                        setState(() {
                          name=val;
                        });
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: 'Name',
                        hintStyle: hintTextStyle,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),

                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      style: textFieldStyle,
                      onChanged: (val){
                        setState(() {
                          userName=val;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 10),
                          hintText: 'Username',
                        hintStyle: hintTextStyle,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      style: textFieldStyle,
                      onChanged: (val){
                        setState(() {
                          email=val;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: 'Email',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 10),
                        hintStyle: hintTextStyle,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      style: textFieldStyle,
                      onChanged: (val){
                        setState(() {
                          phoneNumber=val;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: 'Phone Number',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 10),
                        hintStyle: hintTextStyle,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      style: textFieldStyle,
                      onChanged: (val){
                        setState(() {
                          collegeName=val;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: 'College Name',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 10),
                        hintStyle: hintTextStyle,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      style: textFieldStyle,
                      onChanged: (val){
                        setState(() {
                          password=val;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: 'Password',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 10),
                        hintStyle: hintTextStyle,
                      ),
                      obscureText: true,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
               RaisedButton(
                 color: Colors.white,
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text('Sign Up',style: TextStyle(fontSize: 18),),
                 ),
                 onPressed: ()async{
                   await makeRequest();
                 },
               )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class ResponsiveWidget{

  static bool isScreenLarge(double width, double pixel) {
    return width * pixel >= 1440;
  }

  static bool isScreenMedium(double width, double pixel) {
    return width * pixel < 1440 && width * pixel >=1080;
  }

  static bool isScreenSmall(double width, double pixel) {
    return width * pixel <= 720;
  }
}

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData icon;
  double _width;
  double _pixelRatio;
  bool large;
  bool medium;


  CustomTextField(
      {this.hint,
        this.textEditingController,
        this.keyboardType,
        this.icon,
        this.obscureText= false,
      });

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium=  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: large? 12 : (medium? 10 : 8),
      child: TextFormField(
        controller: textEditingController,
        keyboardType: keyboardType,
        cursorColor: Colors.orange[200],
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.orange[200], size: 20),
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}