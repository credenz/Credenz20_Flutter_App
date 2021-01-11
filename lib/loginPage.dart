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
import 'package:path_provider/path_provider.dart';
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
        // Fluttertoast.showToast(msg: msg);
        setState(() {
          error = msg;
        });
      }else{
        String accessToken=jsonDecode(response.body)['accessToken'];
        print(accessToken);
        await storage.write(key: "accToken", value: accessToken);
        await storage.write(key: 'username', value: userName);
        Fluttertoast.showToast(msg: 'LoggedIn');
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context)=>MyApp()), (route) => false);
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
    return Scaffold(
      backgroundColor: drawerBackgroundColor,
      resizeToAvoidBottomPadding: true,
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
                  "Welcome Back",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Sign In with your username and password",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
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
                Form(

                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: usernameController,
                        keyboardType: TextInputType.text,
                        autofocus: true,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Username",
                          hintText: "eg. user1234",
                          hintStyle: TextStyle(color: Colors.white),
                          labelStyle: TextStyle(color: Colors.white),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: Icon(
                            Icons.alternate_email,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(40),
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: _obscuretext,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Enter Your Password",
                          hintStyle: TextStyle(color: Colors.white),
                          labelStyle: TextStyle(color: Colors.white),

                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: IconButton(
                            onPressed: toggle,
                            icon: Icon(
                              Icons.remove_red_eye,
                            ),
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      Row(children: [
                        Icon(Icons.error,color: Colors.white,),
                        SizedBox(
                          width: getProportionateScreenWidth(10),
                        ),
                        Text(error,style: TextStyle(color: Colors.white),)
                      ])
                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(50),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(getProportionateScreenWidth(60),0,getProportionateScreenWidth(60),0),
                  child: Material(
                    color: drawerBackgroundColor,
                    child: InkWell(

                      child: RaisedButton.icon(
                        color: Colors.deepPurpleAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0))),
                        icon: Icon(Icons.lock),
                        label: Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(23),
                              color: Colors.black),
                        ),
                        onPressed: () {
                          check();
                        },
                        // minWidth: getProportionateScreenWidth(150),
                        // height: getProportionateScreenHeight(60),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(30),),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?",
                        style:
                        TextStyle(fontSize: getProportionateScreenWidth(16),color: Colors.white)),
                    RichText(
                      text: TextSpan(
                          text: "Sign Up",
                          recognizer: TapGestureRecognizer()..
                          onTap=(){
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SignUp()));
                          },
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(16),
                              color: Colors.deepPurple)),
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
    );
  }
}