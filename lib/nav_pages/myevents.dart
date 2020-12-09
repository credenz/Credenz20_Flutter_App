import 'package:credenz20/constants/API.dart';
import 'package:credenz20/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MyEvents extends StatefulWidget {
  @override
  _MyEventsState createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {

  final storage=FlutterSecureStorage();

  getEvents()async{
    String username=await storage.read(key: 'username');
    String accToken=await storage.read(key: "accToken");
    if(username!=null && accToken!=null){
      String url=baseUrl+username+'/present';
      Map<String,String>headers={
        "accessToken":accToken
      };
      http.Response response=await http.get(url,headers: headers);
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEvents();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: drawerBackgroundColor,
        title: Text("My Events"),
      ),
    );
  }
}
