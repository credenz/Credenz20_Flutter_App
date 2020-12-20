import 'package:credenz20/constants/API.dart';
import 'package:credenz20/loginPage.dart';
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
  final storage = FlutterSecureStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;

    _checkLogin();
    getUserInfo();
  }

  getUserInfo() async {
    String url = userProfileUrl;
    String accToken = await storage.read(key: "accToken");
    String username = await storage.read(key: 'username');
    if (username == null || accToken == null) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => Login()));
    } else {
      Map<String, String> headers = {"Authorization": "Bearer $accToken"};
      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        print(url);
        print(headers);
        print(response.body);
        print(response.statusCode);
      } else {
        print(url);
        print(headers);
        print(response.body);
        print(response.statusCode);
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

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        floatingActionButton: FloatingActionButton(
          heroTag: 'abc',
          child: Icon(Icons.edit),
          onPressed: () {
            _formKey.currentState.validate();
          },
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 50.0),
            child: _buildForm(),
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
                style: TextStyle(color: Colors.white),
                validator: (String value) {
                  if (value.isEmpty) return 'Name cannot be empty';

                  return null;
                },
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.white),
                  isDense: true,
                  labelText: 'Name',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
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
                controller: TextEditingController(text: 'credenz'),
                style: TextStyle(color: Colors.white),
                validator: (String value) {
                  if (value.isEmpty) return 'username cannot be empty';
                  return null;
                },
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.white),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
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
                controller: TextEditingController(text: 'credenz@gmail.com'),
                style: TextStyle(color: Colors.white),
                validator: (String value) {
                  if (value.isEmpty) return 'Email cannot be empty';

                  return null;
                },
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  isDense: true,
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
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
                obscureText: !_passwordVisible,
                style: TextStyle(color: Colors.white),
                validator: (String value) {
                  if (value.isEmpty) return 'Password cannot be empty';

                  return null;
                },
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  isDense: true,
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.white,
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
                validator: (String value) {
                  if (value.isEmpty) return 'Mobno cannot be empty';

                  return null;
                },
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  isDense: true,
                  labelText: 'Phone number',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextFormField(
                validator: (String value) {
                  if (value.isEmpty) return 'College Name cannot be empty';

                  return null;
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  isDense: true,
                  labelText: 'College Name',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
};
