import 'dart:convert';

import 'package:credenz20/Home.dart';
import 'package:credenz20/SignUp.dart';
import 'package:credenz20/constants/API.dart';
import 'package:credenz20/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'constants/styles.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String userName;
  String password;
  final storage=FlutterSecureStorage();

  makeRequest()async{
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
        Fluttertoast.showToast(msg: msg);
      }else{
        String accessToken=jsonDecode(response.body)['accessToken'];
        await storage.write(key: "accToken", value: accessToken);
        await storage.write(key: 'username', value: userName);
        Fluttertoast.showToast(msg: 'LoggedIn');
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context)=>Home(title: "Credenz \'20")), (route) => false);
      }
    }else{
      String msg=jsonDecode(response.body)['message'];
      Fluttertoast.showToast(msg: msg.substring(0,1).toUpperCase()+msg.substring(1));
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
                Text('Login',style: TextStyle(color: Colors.white),),
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
                      contentPadding: EdgeInsets.only(left: 10,top: 10,bottom: 10),
                      labelText: 'Username',
                      labelStyle: hintTextStyle,
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
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10,top: 10,bottom: 10),
                      labelText: 'Password',
                      labelStyle: hintTextStyle,
                    ),
                  ),
                ),
                ),
                SizedBox(height: 20,),
                RaisedButton(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Login',style: TextStyle(fontSize: 18),),
                  ),
                  onPressed: ()async{
                    await makeRequest();
                  },
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SignUp()));
                  },
                  child: Container(
                    // color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('New user',style: TextStyle(fontSize: 15,color: Colors.white),),
                    ),
                    // onPressed: ()async{
                    // await makeRequest();
                    // },
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