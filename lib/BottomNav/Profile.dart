import 'package:credenz20/constants/API.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../loginPage.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  final storage=FlutterSecureStorage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserInfo();
  }

  getUserInfo()async{
    String url=userProfileUrl;
    String accToken=await storage.read(key: "accToken");
    String username=await storage.read(key: 'username');
    if(username==null||accToken==null){
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Login()));
    }else {
      Map<String, String>headers = {
        "Authorization": "Bearer $accToken"
      };
      http.Response response=await http.get(url,headers: headers);
      if(response.statusCode==200){
                print(url);
                print(headers);
                print(response.body);
                print(response.statusCode);
      }else{
        print(url);
        print(headers);
        print(response.body);
        print(response.statusCode);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,

    );

  }
}
