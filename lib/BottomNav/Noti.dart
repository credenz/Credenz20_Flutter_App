import 'dart:convert';

import 'package:credenz20/constants/API.dart';
import 'package:credenz20/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Noti extends StatefulWidget {
  @override
  _NotiState createState() => _NotiState();
}

class _NotiState extends State<Noti> {


  bool load=true;
  List list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  getNews()async{
    String url=newsUrl;
    http.Response response=await http.get(url);
    if(response.statusCode==200){
      list=jsonDecode(response.body) as List;
      setState(() {
        load=false;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return load==true?Container(
        color: Colors.black,
        child: Center(
          child: Container(
            child: animatedloader,
            color: drawerBackgroundColor,
          ),)):Scaffold(
      body: ListView.builder(itemBuilder: (BuildContext context,int pos){
        return Column(
          children: [
            ListTile(
              leading: Icon(Icons.notifications,size: 30,),
              title: Text(list[pos]['headline']),
              subtitle: Text(list[pos]['info']),
            ),
            Divider(color: Colors.grey,),
           ],
        );
      },
      itemCount: list.length,),
    );
  }
}
