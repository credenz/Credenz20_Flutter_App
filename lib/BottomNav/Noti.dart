import 'dart:convert';

import 'package:credenz20/constants/API.dart';
import 'package:credenz20/constants/theme.dart';
import 'package:credenz20/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Noti extends StatefulWidget {
  @override
  _NotiState createState() => _NotiState();
}

class _NotiState extends State<Noti> {
  bool load = true;
  List list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  getNews() async {
    String url = newsUrl;
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      list = jsonDecode(response.body) as List;
      setState(() {
        load = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return load == true
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
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int pos) {
                    return Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.notifications,
                            size: 30,
                            color: Color(0xffc4c5d6),
                          ),
                          title: Text(
                            list[pos]['headline'],
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            list[pos]['info'],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Divider(
                          color: Color(0xff313969),
                        ),
                      ],
                    );
                  },
                  itemCount: list.length,
                ),
              )),
        );
  }
}
