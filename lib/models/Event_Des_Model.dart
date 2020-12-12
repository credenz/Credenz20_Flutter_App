import 'package:credenz20/External_Package/CardSilverAppBar.dart';
import 'package:credenz20/constants/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:credenz20/constants/EventData.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';
import 'dart:math';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class EventDes extends StatefulWidget {
  int eventIndex;

  EventDes({Key key, @required this.eventIndex}) : super(key: key);

  @override
  _EventDesState createState() => _EventDesState();
}

class _EventDesState extends State<EventDes> {
  bool favorite = false;
  final storage=FlutterSecureStorage();

  addToCart()async{
    bool pre=await storage.containsKey(key: '${widget.eventIndex}');
    if(pre){
      Fluttertoast.showToast(msg: 'Event already added');
    }else{
      await storage.write(key: '${widget.eventIndex}', value: eventName[widget.eventIndex]);
      Fluttertoast.showToast(msg: 'Event added');
    }
  }

  @override
  Widget build(BuildContext context) {
    int index = widget.eventIndex;
    return MaterialApp(
      home: Material(
        child: Stack(
          children: <Widget>[
            Stack(
              children: [
                Image.asset(
                  // "images/sback0.jpg",
                  "gifs/desback.gif",
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                // Container(
                //   color: Color(0xaa4E164B),
                // ),
              ],
            ),
            CardSliverAppBar(
              height: 250,
              //gifs/space2.gif
              // background:
              //     Image.asset("images/enigma4.png", fit: BoxFit.fitHeight),
              title: Text(eventName[index],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              card: eventimages[index],
              backButton: true,
              backButtonColors: [Colors.white, Colors.white],
              action: IconButton(
                onPressed: () {
                  setState(() {
                    favorite = !favorite;
                  });
                },
                icon: favorite
                    ? Icon(Icons.shopping_cart)
                    : Icon(Icons.add_shopping_cart),
                color: Colors.red,
                iconSize: 30.0,
              ),
              body: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  // color: Color(0x66272034),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height -
                      1.8 * AppBar().preferredSize.height,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: DefaultTabController(
                      length: 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0),
                        ),
                        child: Card(
                            color: Color(0x11000000),
                            child: Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: tabcontroller())),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //A1045A,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RaisedButton(
                    onPressed: ()async{
                      addToCart();
                    },
                    textColor: Colors.white,
                    color: drawerBackgroundColor,
                    child: const Text('Add to Cart',
                        style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),

/*
            Container(
              color: drawerBackgroundColor,
              // color: drawerBackgroundColor,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    border: new Border.all(color: Colors.black),

                    image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage('images/enigma.png'),
                )),
              ),
            ),
*/
          ],
        ),
      ),
    );
  }

  Widget _mainbody() {
    return Stack(
      children: <Widget>[
        TabBarView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  intro[widget.eventIndex],
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  rules[widget.eventIndex],
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  structure[widget.eventIndex],
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  judging[widget.eventIndex],
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  contact[widget.eventIndex],
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ),
            // Icon(Icons.home),
            // Icon(Icons.directions_bike),
            // Icon(Icons.directions_car),
            // Icon(Icons.directions_transit),
            // Icon(Icons.perm_contact_calendar),
          ],
        ),
      ],
    );
  }

  Widget tabcontroller() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: ShiftingTabBar(
        labelStyle: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
        // Specify a color to background or it will pick it from primaryColor of your app ThemeData
        color: Colors.transparent,
        // You can change brightness manually to change text color style to dark and light or it will decide based on your background color
        brightness: Brightness.dark,
        tabs: [
          // Also you should use ShiftingTab widget instead of Tab widget to get shifting animation
          ShiftingTab(icon: Icon(Icons.info_outline), text: "Intro"),
          ShiftingTab(icon: Icon(Icons.assignment), text: "Rules"),
          ShiftingTab(icon: Icon(Icons.device_hub), text: "Structure"),
          ShiftingTab(icon: Icon(Icons.assessment), text: "Judging"),
          ShiftingTab(icon: Icon(Icons.perm_contact_calendar), text: "Contact"),
        ],
      ),
      body: Container(
          // color: Color(0xaa272034),
          child: _mainbody()),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
