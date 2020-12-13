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
      child: loader,
      color: Colors.white,
    ):Scaffold(
      body: ListView.builder(itemBuilder: (BuildContext context,int pos){
        return ListTile(
          title: Text(list[pos]['headline']),
          subtitle: Text(list[pos]['info']),
        );
      },
      itemCount: list.length,),
    );
  }
}
