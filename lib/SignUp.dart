import 'dart:convert';

import 'package:credenz20/constants/API.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'Home.dart';
import 'constants/styles.dart';
import 'constants/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  String name;
  String email;
  String collegeName;
  String password;
  String phoneNumber;
  String userName;




  makeRequest()async{
    String url=signUpUrl;
    Map<String,String>headers={"Content-Type":"application/json"};
    String body='{"username":"${userName.trim()}","name":"${name.trim()}","password":"${password.trim()}","email":"${email.trim()}","phoneno":"${phoneNumber.trim()}","clgname":"${collegeName.trim()}"}';
    http.Response response=await http.post(url,body: body,headers: headers);
    print(url);
    print(body);
    print(response.body);
    print(response.statusCode);
    if(response.statusCode==200){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String accessToken=jsonDecode(response.body)['accessToken'];
      await prefs.setString('accessToken', accessToken);
      Fluttertoast.showToast(msg: 'SignedUp');
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context)=>Home(title: "Credenz \'20")), (route) => false);


    }else{
      String msg=jsonDecode(response.body)['message'];
      Fluttertoast.showToast(msg: msg.toUpperCase());
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: drawerBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
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
