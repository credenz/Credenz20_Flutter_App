import 'dart:convert';
import 'dart:io';

import 'package:credenz20/Home.dart';
import 'package:credenz20/SignUp.dart';
import 'package:credenz20/constants/API.dart';
import 'package:credenz20/constants/theme.dart';
import 'package:credenz20/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/gestures.dart';
import 'External_Package/RaisedGradientButton.dart';
import 'commons/collap_nav_dr.dart';
import 'commons/slide_drawer.dart';
import 'constants/styles.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:credenz20/size_config.dart';

final usernameController = TextEditingController();
final passwordController = TextEditingController();

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String userName;
  String password;
  String error = "";
  bool _obscuretext = true;
  final storage=FlutterSecureStorage();
  bool load=false;

  makeRequest()async{
    userName = usernameController.text;
    password = passwordController.text;
    String url=loginUrl;
    Map<String,String>headers={"Content-Type":"application/json"};
    String body='{"username":"${userName.trim()}","password":"${password.trim()}"}';
    http.Response response=await http.post(url,body: body,headers: headers);
    print(url);
    print(body);
    print(response.body);
    print(response.statusCode);
    if(response.statusCode==200){
      String msg=jsonDecode(response.body)['message'];
      print(msg);
      if(msg!=null){
        setState(() {
          load=false;
        });
        Fluttertoast.showToast(
            backgroundColor: Colors.blue.shade600,
            msg: msg);
        setState(() {
          error = msg;
        });
      }else{
        String accessToken=jsonDecode(response.body)['accessToken'];
        print(accessToken);
        await storage.write(key: "accToken", value: accessToken);
        await storage.write(key: 'username', value: userName);
        Fluttertoast.showToast(msg: 'Logged in',backgroundColor: Colors.blue.shade600);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context)=>SlideDrawer(drawer: MenuDrawer(), child: Home(title: "CREDENZ LIVE"))), (route) => false);
      }
    }else{
      String msg=jsonDecode(response.body)['message'];
      // Fluttertoast.showToast(msg: msg.substring(0,1).toUpperCase()+msg.substring(1));
      setState(() {
        error = "msg";
      });
    }
  }
  void check()  async{
    if (usernameController.text.isEmpty) {
      setState(() {
        error = "Please enter your username";
      });
      return;
    }
    if (passwordController.text.isEmpty) {
      setState(() {
        error = "Please enter your password";
      });
      return;
    }
    makeRequest();
  }
  void toggle() {
    setState(() {
      _obscuretext = !_obscuretext;
    });
  }
  @override
  Widget build(BuildContext context) {
    return load == true
        ? Container(
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
      appBar: AppBar(
        title: Text("LOGIN",
            style: TextStyle(
              fontFamily: 'Segoe UI',
            )),
        centerTitle: true,
        backgroundColor: primary,

      ),
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
                    height: getProportionateScreenHeight(70),
                  ),
                  Text(
                    "Welcome",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Segoe UI',
                        color: Colors.white,
                        fontSize: getProportionateScreenWidth(28),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Sign In with your username and password",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Segoe UI',color: Colors.white),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(100),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 10),child: Container(
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: Colors.white),
                  //
                  //     borderRadius: BorderRadius.circular(5),
                  //   ),
                  //   child: TextFormField(
                  //     style: textFieldStyle,
                  //     onChanged: (val){
                  //       setState(() {
                  //         userName=val;
                  //       });
                  //     },
                  //     decoration: InputDecoration(
                  //       border: InputBorder.none,
                  //       contentPadding: EdgeInsets.only(left: 10,top: 10,bottom: 10),
                  //       labelText: 'Username',
                  //       labelStyle: hintTextStyle,
                  //     ),
                  //   ),
                  // ),
                  // ),
                  Column(
                    children: <Widget>[
                      TextFormField(
                        controller: usernameController,
                        keyboardType: TextInputType.text,
                        autofocus: true,
                        style: TextStyle(fontFamily: 'Segoe UI',color: Color(0xFFd9d9d9)),
                        decoration: InputDecoration(
                          labelText: "Username",
                          hintText: "eg. user1234",
                          hintStyle: TextStyle(fontFamily: 'Segoe UI',color: Color(0xFFd9d9d9)),
                          labelStyle: TextStyle(fontFamily: 'Segoe UI',color: Color(0xFFd9d9d9)),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: Icon(
                            Icons.alternate_email,
                            color: Color(0xff0aa9d7),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(40),
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: _obscuretext,
                        style: TextStyle(fontFamily: 'Segoe UI',color: Color(0xFFd9d9d9)),
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Enter Your Password",
                          hintStyle: TextStyle(fontFamily: 'Segoe UI',color: Color(0xFFd9d9d9)),
                          labelStyle: TextStyle(fontFamily: 'Segoe UI',color: Color(0xFFd9d9d9)),

                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: IconButton(
                            onPressed: toggle,
                            icon: Icon(
                              Icons.remove_red_eye,
                            ),
                            color: Color(0xff0aa9d7),
                          ),
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(20)),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(50),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: RaisedGradientButton(
                        height: 40.0,
                        width: 40.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.lock,color: Colors.white,),
                            SizedBox(width: 20,),
                            Text(
                              'Sign In',
                              style: TextStyle(fontFamily: 'Segoe UI',fontWeight: FontWeight.bold,color: Colors.white,fontSize: 24),
                            ),
                          ],
                        ),
                        gradient: LinearGradient(
                          colors: commonGradient,
                        ),
                        onPressed: () async {
                          setState(() {
                            load=true;
                          });
                          await makeRequest();
                        }),
                  ),
                  SizedBox(height: getProportionateScreenHeight(30),),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Don't have an account?",
                          style:
                          TextStyle(fontFamily: 'Segoe UI',fontSize: getProportionateScreenWidth(16),color: Colors.white)),
                      RichText(
                        text: TextSpan(
                            text: "Sign Up",
                            recognizer: TapGestureRecognizer()..
                            onTap=(){
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SignUp()));
                            },
                            style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontWeight: FontWeight.bold,
                                fontSize: getProportionateScreenWidth(16),
                                color: Color(0xff0aa9d7))),
                      ),
                    ],
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 10),child: Container(
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: Colors.white),
                  //
                  //     borderRadius: BorderRadius.circular(5),
                  //   ),
                  //   child: TextFormField(
                  //     style: textFieldStyle,
                  //     onChanged: (val){
                  //       setState(() {
                  //         password=val;
                  //       });
                  //     },
                  //     obscureText: true,
                  //     decoration: InputDecoration(
                  //       border: InputBorder.none,
                  //       contentPadding: EdgeInsets.only(left: 10,top: 10,bottom: 10),
                  //       labelText: 'Password',
                  //       labelStyle: hintTextStyle,
                  //     ),
                  //   ),
                  // ),
                  // ),
                  // SizedBox(height: 20,),
                  // RaisedButton(
                  //   color: Colors.white,
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Text('Login',style: TextStyle(fontSize: 18),),
                  //   ),
                  //   onPressed: ()async{
                  //     await makeRequest();
                  //   },
                  // ),
                  // SizedBox(height: 20,),
                  // InkWell(
                  //   onTap: (){
                  //     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SignUp()));
                  //   },
                  //   child: Container(
                  //     // color: Colors.white,
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Text('New user',style: TextStyle(fontSize: 15,color: Colors.white),),
                  //     ),
                  //     // onPressed: ()async{
                  //     // await makeRequest();
                  //     // },
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}