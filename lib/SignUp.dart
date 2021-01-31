import 'dart:convert';

import 'package:credenz20/constants/API.dart';
import 'package:credenz20/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'External_Package/RaisedGradientButton.dart';
import 'Home.dart';
import 'commons/collap_nav_dr.dart';
import 'commons/slide_drawer.dart';
import 'constants/theme.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String ieeeMenber;
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  bool _obscureText = true;
  TextEditingController nameController=TextEditingController();
  TextEditingController usernameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController collegeController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController password1Controller=TextEditingController();
  // TextEditingController emailController;
  String name;
  String email;
  String collegeName;
  String password="";
  String password1="";
  String phoneNumber;
  String userName;
  bool load=false;
  final storage = FlutterSecureStorage();

  makeRequest() async {
    if(nameController.text.trim().isEmpty){
      Fluttertoast.showToast(msg: 'Please enter name',backgroundColor: Colors.blue.shade600);
      return;
    }else if(usernameController.text.trim().isEmpty){
      Fluttertoast.showToast(msg: 'Please enter username',backgroundColor: Colors.blue.shade600);
      return;
    }else if(emailController.text.trim().isEmpty){
      Fluttertoast.showToast(msg: 'Please enter email',backgroundColor: Colors.blue.shade600);
      return;
    }else if(collegeController.text.trim().isEmpty){
      Fluttertoast.showToast(msg: 'Please enter college name',backgroundColor: Colors.blue.shade600);
      return;
    }else if(passwordController.text.trim().isEmpty){
      Fluttertoast.showToast(msg: 'Please enter password',backgroundColor: Colors.blue.shade600);
      return;
    }else if(password1Controller.text.trim().isEmpty){
      Fluttertoast.showToast(msg: 'Please enter confirm password',backgroundColor: Colors.blue.shade600);
      return;
    }
    if(passwordController.text.trim()!=password1Controller.text.trim()) {
      Fluttertoast.showToast(
          msg: 'Passwords do not match', backgroundColor: Colors.blue.shade600);
      return;
    }
    setState(() {
      load=true;
    });
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
      await storage.write(key: 'email', value: email);
      Fluttertoast.showToast(msg: 'Signed Up',backgroundColor: Colors.blue.shade600);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context)=>SlideDrawer(drawer: MenuDrawer(), child: Home(title: "CREDENZ LIVE"))), (route) => false);
    } else {
      setState(() {
        load=false;
      });
      String msg = jsonDecode(response.body)['message'];
      Fluttertoast.showToast(
          msg: msg.substring(0, 1).toUpperCase() + msg.substring(1),backgroundColor: Colors.blue.shade600);
    }
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    collegeController.dispose();
    passwordController.dispose();
    password1Controller.dispose();
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

    return load==true?Container(
        height: MediaQuery.of(context).size.height,

        //color: Color(0xFF000000),
        child: Center(
          child: Container(
            child: animatedloader,
            //color: notiBackColor,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/contactb.jpg"),
                  fit: BoxFit.fill,
                )),
          ),
        )):Scaffold(
      backgroundColor: Color(0xFF121212),
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: backColor,
                image: DecorationImage(
                  image: AssetImage("images/contactb.jpg"),
                  fit: BoxFit.fill,
                )),
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
                        fontFamily: 'Segoe UI',
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
                    style: TextStyle(fontFamily: 'Segoe UI',color: Colors.white),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(10.0),
                    elevation: _large ? 12 : (_medium ? 10 : 8),
                    child: TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      cursorColor: Color(0xff0aa9d7),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person,
                            color: Color(0xff0aa9d7), size: 20),
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
                      controller: usernameController,
                      keyboardType: TextInputType.text,
                      cursorColor: Color(0xff0aa9d7),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person,
                            color: Color(0xff0aa9d7), size: 20),
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
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Color(0xff0aa9d7),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email,
                            color: Color(0xff0aa9d7), size: 20),
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
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      cursorColor: Color(0xff0aa9d7),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone,
                            color: Color(0xff0aa9d7), size: 20),
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
                      controller: collegeController,
                      keyboardType: TextInputType.text,
                      cursorColor: Color(0xff0aa9d7),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.school,
                            color: Color(0xff0aa9d7), size: 20),
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
                    child: DropdownButtonFormField<String>(
                      items: [
                        DropdownMenuItem(
                          child: Text('IEEE member'),
                          value: 'IEEE',
                        ),
                        DropdownMenuItem(
                          child: Text('Non-IEEE member'),
                          value: 'Non',
                        ),
                      ],
                      isExpanded: true,
                      onChanged: (String val) {
                        setState(() {
                          ieeeMenber = val;
                        });
                      },
                      value: ieeeMenber,
                      decoration: InputDecoration.collapsed(hintText: 'Select Category'),
                      // hint: Text('Select Category'),
                    ),
                  ),

                  SizedBox(height: _height / 30.0),
                  Material(
                    borderRadius: BorderRadius.circular(10.0),
                    elevation: _large ? 12 : (_medium ? 10 : 8),
                    child: TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      cursorColor: Color(0xff0aa9d7),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock,
                              color: Color(0xff0aa9d7), size: 20),
                          hintText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none),
                          suffixIcon: IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              color: Color(0xff0aa9d7),
                              onPressed: toggle)),
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                      obscureText: _obscureText,
                    ),
                  ),
                  SizedBox(height: _height / 30.0),
                  Material(
                    borderRadius: BorderRadius.circular(10.0),
                    elevation: _large ? 12 : (_medium ? 10 : 8),
                    child: TextFormField(
                      controller: password1Controller,
                      keyboardType: TextInputType.text,
                      cursorColor: Color(0xff0aa9d7),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock,
                              color: Color(0xff0aa9d7), size: 20),
                          hintText: "Confirm Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none),
                          suffixIcon: IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              color: Color(0xff0aa9d7),
                              onPressed: toggle)),
                      onChanged: (val) {
                        setState(() {
                          password1 = val;
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
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 20),
                    child: RaisedGradientButton(
                        height: 40.0,
                        width: 40.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 20,),
                            Text(
                              'Sign Up',
                              style: TextStyle(color: Colors.white,fontSize: 24),
                            ),
                            SizedBox(width: 20,),
                            Icon(
                              Icons.double_arrow_sharp,
                              color: Colors.white,
                              size: 25,
                            ),
                          ],
                        ),
                        gradient: LinearGradient(
                          colors: commonGradient,
                        ),
                        onPressed: () async {
                          await makeRequest();
                        }),
                  ),
                ],
              ),
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
