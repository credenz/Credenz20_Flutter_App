import 'dart:convert';

import 'package:credenz20/External_Package/RaisedGradientButton.dart';
import 'package:credenz20/commons/collap_nav_dr.dart';
import 'package:credenz20/commons/slide_drawer.dart';
import 'package:credenz20/constants/API.dart';
import 'package:credenz20/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../Home.dart';
import '../loginPage.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _passwordVisible;
  bool load = true;
  final storage = FlutterSecureStorage();
  TextEditingController nameController;
  TextEditingController usernameController;
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController phoneController;
  TextEditingController collegeController;
  String accToken;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
    getUserInfo();
  }

  updateProfile() async {
    setState(() {
      load=true;
    });
    String url = baseUrl + usernameController.text.toString() + '/update';
    print(url);
    String body =
        '{"username":"${usernameController.text.toString()}","name":"${nameController.text.toString()}","password":"${passwordController.text.toString()}","email":"${emailController.text.toString()}","phoneno":"${phoneController.text.toString()}","clgname":"${collegeController.text.toString()}"}';
    print(body);
    Map<String, String> headers = {
      "Authorization": "Bearer $accToken",
      "Content-Type": "application/json"
    };
    print(headers);
    http.Response response = await http.put(url, body: body, headers: headers);
    if (response.statusCode == 200) {
      await storage.write(key: 'username', value: usernameController.text.trim());
      await storage.write(key: 'email', value: emailController.text.trim());
      setState(() {
        load=false;
      });
      Fluttertoast.showToast(msg: 'Profile updated',backgroundColor: Colors.blue.shade600);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => SlideDrawer(
                  drawer: MenuDrawer(), child: Home(title: "CREDENZ LIVE"))),
          (route) => false);
    } else {
      setState(() {
        load=false;
      });
      Fluttertoast.showToast(msg: 'Please try again in sometime',backgroundColor: Colors.blue.shade600);
    }
    print(response.body);
  }

  getUserInfo() async {
    String url = userProfileUrl;
    accToken = await storage.read(key: "accToken");
    String username = await storage.read(key: 'username');
    if (username == null || accToken == null) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => Login()));
    } else {
      url += username;
      Map<String, String> headers = {"Authorization": "Bearer $accToken"};
      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        print(res);
        nameController = new TextEditingController();
        usernameController = new TextEditingController();
        emailController = new TextEditingController();
        passwordController = new TextEditingController();
        phoneController = new TextEditingController();
        collegeController = new TextEditingController();
        setState(() {
          nameController.text = res['name'];
          usernameController.text = res['username'];
          emailController.text = res['email'];
          passwordController.text = res['password'];
          phoneController.text = res['phoneno'].toString();
          collegeController.text = res['clgname'];
          load = false;
        });
        print(url);
        print(headers);
        print(response.body);
        print(response.statusCode);
      } else {
        print(url);
        print(headers);
        print(response.body);
        print(response.statusCode);
        setState(() {
          load = false;
        });
      }
    }
  }

  _checkLogin() async {
    String username = await storage.read(key: 'username');
    String accToken = await storage.read(key: "accToken");
    if (username == null && accToken == null) {
      Fluttertoast.showToast(msg: "Please login before you register");
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => Login()));
      // .push(context,
      //     MaterialPageRoute(builder: (BuildContext context) => Login()));

    } else {
      getUserInfo();
    }
  }

  @override
  Widget build(BuildContext context) {
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
        appBar: AppBar(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light,statusBarColor:Colors.transparent),
          centerTitle: true,
          backgroundColor: drawerBackgroundColor,
          title: Text("Edit Profile",style: TextStyle(fontFamily: 'Segoe UI',),),
        ),
        backgroundColor: Colors.black,
        body: load == true
            ? Container(
            height: MediaQuery.of(context).size.height,
            color: Color(0xFF000000),
            child: Center(
              child: Container(
                child: animatedloader,
                color: notiBackColor,
              ),
            ))
            : Container(
          height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: backColor,
                  image: DecorationImage(
                    image: AssetImage("images/contactb.jpg"),
                    fit: BoxFit.fill,
                  )),
              child: SingleChildScrollView(

                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20.0, bottom: 50.0),
                      child: _buildForm(),
                    ),
                    RaisedGradientButton(
                      height: 35.0,
                      width: 100.0,
                      child: Text(
                        'SAVE',
                        style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: textColor),
                      ),
                      gradient: LinearGradient(
                        colors: commonGradient,
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await updateProfile();
                        }
                        // await updateProfile();
                      },
                    ),

                    /*  RaisedButton(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('SAVE',style: TextStyle(fontSize: 18),),
                        ),
                        onPressed: ()async{
                          if (_formKey.currentState.validate()){
                            await updateProfile();
                          }
                          // await updateProfile();
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0),bottomLeft:Radius.circular(16.0),bottomRight: Radius.circular(16.0) )
                        ),
                      ),*/
                  ],
                ),
              ),
            ));
  }

  _buildForm() {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextFormField(
                controller: nameController,
                style: TextStyle(color: textColor,fontFamily: 'Segoe UI',),
                validator: (String value) {
                  if (value.isEmpty) return 'Name cannot be empty';

                  return null;
                },
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Name',
                  // enabledBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.white),
                  // ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: dividerColor),
                  ),
                  labelStyle: TextStyle(color: textColor,fontFamily: 'Segoe UI',),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: dividerColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextFormField(
                controller: usernameController,
                style: TextStyle(color: textColor,fontFamily: 'Segoe UI',),
                validator: (String value) {
                  if (value.isEmpty) return 'username cannot be empty';
                  return null;
                },
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Username',
                  labelStyle: TextStyle(color: textColor,fontFamily: 'Segoe UI',),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: dividerColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                enabled: false,
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.all(15.0),
            //   child: TextFormField(
            //     controller: emailController,
            //     style: TextStyle(color: textColor),
            //     validator: (String value) {
            //       if (value.isEmpty) return 'Email cannot be empty';
            //
            //       return null;
            //     },
            //     cursorColor: Colors.white,
            //     decoration: InputDecoration(
            //       disabledBorder: OutlineInputBorder(
            //         borderSide: BorderSide(color: Colors.white),
            //       ),
            //       isDense: true,
            //       labelText: 'Email',
            //       labelStyle: TextStyle(color: Colors.white),
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(5.0),
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextFormField(
                controller: emailController,
                validator: (String value) {
                  if (value.isEmpty) return 'Email cannot be empty';

                  return null;
                },
                style: TextStyle(color: textColor,fontFamily: 'Segoe UI',),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: dividerColor),
                  ),
                  isDense: true,
                  labelText: 'Email',
                  labelStyle: TextStyle(color: textColor,fontFamily: 'Segoe UI',),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: dividerColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextFormField(
                controller: passwordController,
                obscureText: !_passwordVisible,
                style: TextStyle(color: textColor,fontFamily: 'Segoe UI',),
                validator: (String value) {
                  if (value.isEmpty) return 'Password cannot be empty';

                  return null;
                },
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: dividerColor),
                  ),
                  isDense: true,
                  labelText: 'Password',
                  labelStyle: TextStyle(color: textColor,fontFamily: 'Segoe UI',),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: dividerColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: dividerColor,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextFormField(
                controller: phoneController,
                validator: (String value) {
                  if (value.isEmpty) return 'Mobno cannot be empty';

                  return null;
                },
                style: TextStyle(color: textColor,fontFamily: 'Segoe UI',),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: dividerColor),
                  ),
                  isDense: true,
                  labelText: 'Phone number',
                  labelStyle: TextStyle(color: textColor,fontFamily: 'Segoe UI',),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: dividerColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextFormField(
                readOnly: true,
                controller: collegeController,
                validator: (String value) {
                  if (value.isEmpty) return 'College Name cannot be empty';

                  return null;
                },
                style: TextStyle(color: textColor,fontFamily: 'Segoe UI',),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: dividerColor),
                  ),
                  isDense: true,
                  labelText: 'College Name',
                  labelStyle: TextStyle(color: textColor,fontFamily: 'Segoe UI',),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: dividerColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
