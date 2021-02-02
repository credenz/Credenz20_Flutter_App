import 'dart:convert';

import 'package:credenz20/constants/API.dart';
import 'package:credenz20/constants/theme.dart';
import 'package:credenz20/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MyEvents extends StatefulWidget {
  @override
  _MyEventsState createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {

  final storage=FlutterSecureStorage();
  List eventList;
  bool load=true;

  getEvents()async{
    String username=await storage.read(key: 'username');
    String accToken=await storage.read(key: "accToken");

    if(accToken==null || accToken==null){
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Login()));
    }
    else {

      if (username != null && accToken != null && username.isNotEmpty && accToken.isNotEmpty) {

        print(accToken);
        String url = baseUrl + username + '/present';
        Map<String, String>headers = {
          "Authorization": "Bearer $accToken"
        };
        http.Response response = await http.get(url, headers: headers);
        if (response.statusCode == 200) {
          setState(() {
            eventList = jsonDecode(response.body) as List;
            load = false;
          });
          print(eventList);
        }
        else {
          Fluttertoast.showToast(
              msg: 'Cannot get events', backgroundColor: Colors.blue.shade600);
          setState(() {
            load = false;
          });
        }
      } else {
        Fluttertoast.showToast(
            msg: 'Please login first!', backgroundColor: Colors.blue.shade600);
        Navigator.pop(context);
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => Login()));
      }
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
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light,statusBarColor:Colors.transparent),
        centerTitle: true,
        backgroundColor: primary,
        title: Text("My Events", style: TextStyle(fontFamily: 'Segoe UI',),),
      ),
      body: load==true?Container(
          color: notiBackColor,

          child: Center(
        child: Container(
          child: animatedloader,
          color: notiBackColor,
        ),)
      ):Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: notiBackColor,
            /*image: DecorationImage(
              image: AssetImage("images/contactb.jpg"),
              fit: BoxFit.fill,
            )*/),
        child: eventList.length==0?Image.asset('images/noEventImage.png'):ListView.builder(itemBuilder: (BuildContext context,int pos){
          return Column(
            children: [
              ListTile(
                title: Text("Event Name:- ${eventList[pos]['event_username'].toString().toUpperCase()}", style: TextStyle(color: textColor,fontFamily: 'Segoe UI',),),
                subtitle: Text("Password:- ${eventList[pos]['random_pw']}", style: TextStyle(color: textColor, fontFamily: 'Segoe UI',),),
              ),
              Divider(
                color: Color(0xff313969),
              ),
            ],
          );

        },
        itemCount: eventList.length,),
      ),
    );
  }
}
