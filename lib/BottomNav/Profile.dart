import 'dart:convert';

import 'package:credenz20/External_Package/RaisedGradientButton.dart';
import 'package:credenz20/constants/API.dart';
import 'package:credenz20/constants/theme.dart';
import 'package:credenz20/loginPage.dart';
import 'package:credenz20/nav_pages/editprofile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../loginPage.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
  String name = ' ';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
    getUserInfo();
  }

  getUserInfo() async {
    String url = userProfileUrl;
    String accToken = await storage.read(key: "accToken");
    String username = await storage.read(key: 'username');
    name = username;
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
    return Scaffold(
        // backgroundColor: backColor,
        // floatingActionButton: FloatingActionButton(
        //   heroTag: 'abc',
        //   child: Icon(Icons.edit),
        //   onPressed: () {
        //     Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (BuildContext context) => EditProfile(),
        //         ));
        //     // _formKey.currentState.validate();
        //   },
        //   shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.only(
        //           topLeft: Radius.circular(16.0),
        //           bottomRight: Radius.circular(16.0))),
        // ),
        body: load == true
            ? Container(
                child: loader1,
                color: notiBackColor,
              )
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
                      _headerofProfile(),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0, bottom: 50.0),
                        child: _buildForm(),
                      ),
                    ],
                  ),
                ),
              ));
  }

  _headerofProfile() {
    return ClipPath(
      // clipper: new CustomHalfCircleClipper(),
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          // color: Color(0xff128ba5),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff1269a0), Color(0xff0e3876)],
          ),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(8.0),
            bottomLeft: Radius.circular(8.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30.0,
                backgroundImage: AssetImage("images/profileHeadIcon.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        'Hello',
                        style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 18.0,
                            color: textColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        name,
                        style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 18.0,
                            color: textColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: RaisedGradientButton(
                    height: 40.0,
                    width: 40.0,
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    gradient: LinearGradient(
                      colors: commonGradient,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => EditProfile(),
                          ));
                    }),
                /*RawMaterialButton(
                  constraints: BoxConstraints(),
                  fillColor: Colors.blue,
                  padding: EdgeInsets.all(6),
                  // color: Colors.blue,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              EditProfile(),
                        ));
                  },
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0))),
                ),*/
              )
            ],
          ),
        ),
      ),
    );
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
                style: TextStyle(
                  color: textColor,
                  fontFamily: 'Segoe UI',
                ),
                validator: (String value) {
                  if (value.isEmpty) return 'Name cannot be empty';

                  return null;
                },
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    color: textColor,
                    fontFamily: 'Segoe UI',
                  ),
                  isDense: true,
                  labelText: 'Name',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: dividerColor),
                  ),
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
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextFormField(
                controller: usernameController,
                style: TextStyle(
                  color: textColor,
                  fontFamily: 'Segoe UI',
                ),
                validator: (String value) {
                  if (value.isEmpty) return 'username cannot be empty';
                  return null;
                },
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Username',
                  labelStyle: TextStyle(
                    color: textColor,
                    fontFamily: 'Segoe UI',
                  ),
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
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextFormField(
                controller: emailController,
                style: TextStyle(
                  color: textColor,
                  fontFamily: 'Segoe UI',
                ),
                validator: (String value) {
                  if (value.isEmpty) return 'Email cannot be empty';

                  return null;
                },
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: dividerColor),
                  ),
                  isDense: true,
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: textColor,
                    fontFamily: 'Segoe UI',
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
            //     controller: passwordController,
            //     obscureText: !_passwordVisible,
            //     style: TextStyle(color: Colors.white),
            //     validator: (String value) {
            //       if (value.isEmpty) return 'Password cannot be empty';
            //
            //       return null;
            //     },
            //     keyboardType: TextInputType.visiblePassword,
            //     decoration: InputDecoration(
            //       enabledBorder: OutlineInputBorder(
            //         borderSide: BorderSide(color: Colors.white),
            //       ),
            //       isDense: true,
            //       labelText: 'Password',
            //       labelStyle: TextStyle(color: Colors.white),
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(5.0),
            //       ),
            //       suffixIcon: IconButton(
            //         icon: Icon(
            //           _passwordVisible
            //               ? Icons.visibility
            //               : Icons.visibility_off,
            //           color: Colors.white,
            //         ),
            //         onPressed: () {
            //           // Update the state i.e. toogle the state of passwordVisible variable
            //           setState(() {
            //             _passwordVisible = !_passwordVisible;
            //           });
            //         },
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextFormField(
                controller: phoneController,
                validator: (String value) {
                  if (value.isEmpty) return 'Mobno cannot be empty';

                  return null;
                },
                style: TextStyle(
                  color: textColor,
                  fontFamily: 'Segoe UI',
                ),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: dividerColor),
                  ),
                  isDense: true,
                  labelText: 'Phone number',
                  labelStyle: TextStyle(
                    color: textColor,
                    fontFamily: 'Segoe UI',
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                enabled: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextFormField(
                controller: collegeController,
                validator: (String value) {
                  if (value.isEmpty) return 'College Name cannot be empty';

                  return null;
                },
                style: TextStyle(
                  color: textColor,
                  fontFamily: 'Segoe UI',
                ),
                decoration: InputDecoration(
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: dividerColor),
                  ),
                  isDense: true,
                  labelText: 'College Name',
                  labelStyle: TextStyle(
                    color: textColor,
                    fontFamily: 'Segoe UI',
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                enabled: false,
              ),
            ),
          ],
        ));
  }
}
/*
class CustomHalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    Path path = Path();
    path.lineTo(0, size.height-30.0);
    path.lineTo(20.0, size.height-30.0);
    var curXPos = 20.0;
    var curYPos = size.height-30.0;
    var increment = (size.width / 2) - 20.0;
    curXPos += increment-10.0;
    while (curXPos < size.width-10.0) {
      // path.arcToPoint(Offset(curXPos, curYPos), radius: Radius.circular(175));
      // path.arcToPoint(Offset(curXPos, curYPos), radius: Radius.circular(175),clockwise: false,rotation: 180.0);
      path.arcToPoint(Offset(curXPos, curYPos),clockwise: false, radius: Radius.circular(175));
      path.lineTo(curXPos+20.0,size.height-30.0);
      curXPos += increment+10.0;
    }
    path.lineTo(size.width,size.height-30.0);
    path.lineTo(size.width,0);
    // path.lineTo(0,0);
    // path.lineTo(0,size.height);
    path.moveTo(0,size.height-30.0);
    path.lineTo(20.0, size.height-30.0);
    path.arcToPoint(Offset(size.width/2-10.0, size.height-30.0), radius: Radius.circular(175));
    path.lineTo(size.width/2+10.0,size.height-30.0);
    path.arcToPoint(Offset(size.width-20.0, size.height-30.0), radius: Radius.circular(175));
    path.lineTo(size.width,size.height-30.0);
    path.lineTo(size.width,size.height);
    path.lineTo(0,size.height);






    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}*/
