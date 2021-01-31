import 'dart:convert';

import 'package:credenz20/constants/API.dart';
import 'package:credenz20/constants/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
class Sponsors extends StatefulWidget {
  @override
  _SponsorsState createState() => _SponsorsState();
}



class _SponsorsState extends State<Sponsors> {





  bool load=true;


  List list=[];
  List<Widget>spon=[];

  List<String> images = [
    /*AssetImage("images/aarnel.png"),
    AssetImage("images/byju.jpg"),
    AssetImage("images/cc.jpg"),
    AssetImage("images/collegepond.jpg"),
    AssetImage("images/finiq.png"),*/
    /*"images/aarnel.png",
    "images/byju.jpg",
    "images/cc.jpg",*/
    // "images/collegepond.jpg",
    // "images/finiq.png",
    "images/yocket.png"

  ];
  List<String> name = [
    "Yocket",

    ];
  List<String> title = [
    "Educational Partner",
  ];


  Widget card(int index){
    return  Padding(

      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: [

            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width*0.7,
                height: MediaQuery.of(context).size.width*0.7,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  /*borderRadius: new BorderRadius.only(
                        topLeft:  const  Radius.circular(40.0),
                        topRight: const  Radius.circular(40.0),
                        bottomRight: const  Radius.circular(40.0),
                        bottomLeft: const  Radius.circular(40.0),),*/

                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 150,
                      color: Colors.blueGrey.withOpacity(1),
                    )
                  ],
                ),
                child: CircleAvatar(
                  radius: 300,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(list[index]["imageurl"]),
                  child: ClipOval(child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    // child: Image.asset(images[index]),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(list[index]["name"], style: TextStyle(fontFamily:"Segoe UI Bold",fontSize: 30,color: Color(0xFF121212)),),
            SizedBox(
              height: 10,
            ),
            Text(list[index]["description"], style: TextStyle(fontFamily:"Segoe UI Bold", fontSize: 20,color: Color(0xFF121212)),),


          ],
        ),
      )
      /*Container(
        //height: 400,
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        child: DecoratedBox(

            decoration: BoxDecoration(
              shape: BoxShape.circle,
                /*borderRadius: new BorderRadius.only(
                  topLeft:  const  Radius.circular(40.0),
                  topRight: const  Radius.circular(40.0),
                  bottomRight: const  Radius.circular(40.0),
                  bottomLeft: const  Radius.circular(40.0),),*/
                image: DecorationImage(
                    image:images[index],
                    fit: BoxFit.fitWidth
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 20,
                    color: Colors.grey.withOpacity(0.5),
                  )
                ],
            ),

        ),
      ),*/
    );

  }

  getSponsors()async{
    String url=sponsorUrl;
    http.Response response=await http.get(url);
    if(response.statusCode==200) {
      list = jsonDecode(response.body) as List;
      for (int i = 0; i < list.length; i++) {
        spon.add(card(i));
      }
      setState(() {
        load = false;
      });
    }else{
      Fluttertoast.showToast(msg: 'Please come back later',backgroundColor: Colors.blue.shade600);
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSponsors();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light,statusBarColor:Colors.transparent),
        centerTitle: true,
        backgroundColor: primary,
        title: Text("Sponsors",style: TextStyle(color: Colors.white),),
      ),
      body: load == true
          ? Container(
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
          )):Container(
         decoration: BoxDecoration(
          color: notiBackColor,
          image: DecorationImage(
            image: AssetImage("images/sponsorsbackground.jpg"),
            fit: BoxFit.cover,
          )),
        child: ListWheelScrollView(
          itemExtent: MediaQuery.of(context).size.width,
          children: spon,
          diameterRatio: 3,
          physics: FixedExtentScrollPhysics(),


        ),
      ),
    );
  }
}