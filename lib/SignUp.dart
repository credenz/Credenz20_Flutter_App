import 'dart:convert';

import 'package:credenz20/constants/API.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'Home.dart';
import 'constants/styles.dart';
import 'constants/theme.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
