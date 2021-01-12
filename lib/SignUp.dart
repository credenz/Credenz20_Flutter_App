import 'dart:convert';

import 'package:credenz20/constants/API.dart';
import 'package:credenz20/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'Home.dart';
import 'commons/collap_nav_dr.dart';
import 'commons/slide_drawer.dart';
import 'constants/theme.dart';

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
  bool _obscureText = true;
  String name;
  String email;
  String collegeName;
  String password;
  String phoneNumber;
  String userName;
  final storage = FlutterSecureStorage();

  makeRequest() async {
    String url = signUpUrl;
    Map<String, String> headers = {"Content-Type": "application/json"};
    String body =
        '{"username":"$userName","name":"$name","password":"$password","email":"$email","phoneno":"$phoneNumber","clgname":"$collegeName"}';
    http.Response response = await http.post(url, body: body, headers: headers);
    print(url);
    print(body);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      await storage.write(
          key: "accToken", value: jsonDecode(response.body)['accessToken']);
      await storage.write(key: 'username', value: userName);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context)=>SlideDrawer(drawer: MenuDrawer(), child: Home(title: "CREDENZ LIVE"))), (route) => false);
    } else {
      String msg = jsonDecode(response.body)['message'];
      Fluttertoast.showToast(
          msg: msg.substring(0, 1).toUpperCase() + msg.substring(1));
    }
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    void toggle() {
      setState(() {
        _obscureText = !_obscureText;
      });
    }

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: drawerBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(40),
                ),
                Text(
                  "Sign Up",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Text(
                  "Enter your details",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Material(
                  borderRadius: BorderRadius.circular(10.0),
                  elevation: _large ? 12 : (_medium ? 10 : 8),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.deepPurpleAccent,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person,
                          color: Colors.deepPurpleAccent, size: 20),
                      hintText: "Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none),
                    ),
                    onChanged: (val) {
                      setState(() {
                        name = val;
                      });
                    },
                  ),
                ),
                SizedBox(height: _height / 30.0),
                Material(
                  borderRadius: BorderRadius.circular(10.0),
                  elevation: _large ? 12 : (_medium ? 10 : 8),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.deepPurpleAccent,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person,
                          color: Colors.deepPurpleAccent, size: 20),
                      hintText: "Username",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none),
                    ),
                    onChanged: (val) {
                      setState(() {
                        userName = val;
                      });
                    },
                  ),
                ),
                SizedBox(height: _height / 30.0),
                Material(
                  borderRadius: BorderRadius.circular(10.0),
                  elevation: _large ? 12 : (_medium ? 10 : 8),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.deepPurpleAccent,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email,
                          color: Colors.deepPurpleAccent, size: 20),
                      hintText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none),
                    ),
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                ),
                SizedBox(height: _height / 30.0),
                Material(
                  borderRadius: BorderRadius.circular(10.0),
                  elevation: _large ? 12 : (_medium ? 10 : 8),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    cursorColor: Colors.deepPurpleAccent,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone,
                          color: Colors.deepPurpleAccent, size: 20),
                      hintText: "Phone Number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none),
                    ),
                    onChanged: (val) {
                      setState(() {
                        phoneNumber = val;
                      });
                    },
                  ),
                ),
                SizedBox(height: _height / 30.0),
                Material(
                  borderRadius: BorderRadius.circular(10.0),
                  elevation: _large ? 12 : (_medium ? 10 : 8),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.deepPurpleAccent,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.school,
                          color: Colors.deepPurpleAccent, size: 20),
                      hintText: "College Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none),
                    ),
                    onChanged: (val) {
                      setState(() {
                        collegeName = val;
                      });
                    },
                  ),
                ),
                SizedBox(height: _height / 30.0),
                Material(
                  borderRadius: BorderRadius.circular(10.0),
                  elevation: _large ? 12 : (_medium ? 10 : 8),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.deepPurpleAccent,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock,
                            color: Colors.deepPurpleAccent, size: 20),
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none),
                        suffixIcon: IconButton(
                            icon: Icon(Icons.remove_red_eye),
                            color: Colors.deepPurpleAccent,
                            onPressed: toggle)),
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                    obscureText: _obscureText,
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 10),child: Container(
                //     decoration: BoxDecoration(
                //       border: Border.all(color: Colors.white),
                //       borderRadius: BorderRadius.circular(5),
                //     ),
                //     child: TextFormField(
                //       style: textFieldStyle,
                //       onChanged: (val){
                //         setState(() {
                //           password=val;
                //         });
                //       },
                //       decoration: InputDecoration(
                //           hintText: 'Password',
                //         border: InputBorder.none,
                //         contentPadding: EdgeInsets.only(left: 10),
                //         hintStyle: hintTextStyle,
                //       ),
                //       obscureText: true,
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 170,

                  margin: EdgeInsets.fromLTRB(getProportionateScreenWidth(55),0,getProportionateScreenWidth(55),0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0))),
                    color: Colors.deepPurpleAccent,
                    // icon: Icon(Icons.double_arrow_sharp),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 4, 4, 4),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(4, 0, 10, 0),
                            child: Icon(
                              Icons.double_arrow_sharp,
                              color: Colors.black,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                      // Text(,),
                    ),
                    onPressed: () async {
                      await makeRequest();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResponsiveWidget {
  static bool isScreenLarge(double width, double pixel) {
    return width * pixel >= 1440;
  }

  static bool isScreenMedium(double width, double pixel) {
    return width * pixel < 1440 && width * pixel >= 1080;
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

  CustomTextField({
    this.hint,
    this.textEditingController,
    this.keyboardType,
    this.icon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: large ? 12 : (medium ? 10 : 8),
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
