import 'package:flutter/material.dart';
import 'package:sliverbar_with_card/sliverbar_with_card.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';

class EventDes extends StatefulWidget {
  @override
  _EventDesState createState() => _EventDesState();
}

class _EventDesState extends State<EventDes> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: NestedScrollView(
        scrollDirection: Axis.vertical,

        headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled){
          return <Widget>[
            CardSliverAppBar(
              height: 300,
              background:
              Image.asset("images/contraption.png", fit: BoxFit.fitHeight),
              title: Text("Clash",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              card: AssetImage('images/icon.jpg'),
              backButton: true,
              backButtonColors: [Colors.white, Colors.black],
              action: IconButton(
                onPressed: () {
                  setState(() {
                    favorite = !favorite;
                  });
                },
                icon: favorite
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border),
                color: Colors.red,
                iconSize: 30.0,
              ),
              body: Container(
                alignment: Alignment.topLeft,
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),

          ];
        },

        body: DefaultTabController(
          length: 5,
          child: Scaffold(
            // Use ShiftingTabBar instead of appBar
            appBar: ShiftingTabBar(
              // Specify a color to background or it will pick it from primaryColor of your app ThemeData
              color: Colors.grey,
              // You can change brightness manually to change text color style to dark and light or
              // it will decide based on your background color
              // brightness: Brightness.dark,
              tabs: [
                // Also you should use ShiftingTab widget instead of Tab widget to get shifting animation
                ShiftingTab(
                  icon: Icon(Icons.home),
                  text: "Test 1",
                ),
                ShiftingTab(
                    icon: Icon(Icons.directions_bike), text: "Test 2"),
                ShiftingTab(
                    icon: Icon(Icons.directions_car), text: "Test 3"),
                ShiftingTab(
                    icon: Icon(Icons.directions_transit), text: "Test 4"),
                ShiftingTab(
                    icon: Icon(Icons.directions_boat), text: "Test 5"),
              ],
            ),
            // Other parts of the app are exacly same as default TabBar widget
            body: TabBarView(
              children: [
                Icon(Icons.home),
                Icon(Icons.directions_bike),
                Icon(Icons.directions_car),
                Icon(Icons.directions_transit),
                Icon(Icons.directions_boat),
              ],
            ),
          ),
        ),
      ),
      // home:
    );
  }
}
