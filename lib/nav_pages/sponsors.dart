import 'package:credenz20/constants/theme.dart';
import 'package:flutter/material.dart';
class Sponsors extends StatefulWidget {
  @override
  _SponsorsState createState() => _SponsorsState();
}

class _SponsorsState extends State<Sponsors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: drawerBackgroundColor,
        title: Text("Sponsors"),
      ),
      body: ListWheelScrollView(
        children: [
          Card(
            child: Image.asset(
                  "images/aarnel.png",
                  fit: BoxFit.fill
              ),
          ),
          Image.asset(
              "images/aarnel.png",
              fit: BoxFit.fill
          ),
          Image.asset(
              "images/aarnel.png",
              fit: BoxFit.fill
          ),
          Image.asset(
              "images/aarnel.png",
              fit: BoxFit.fill
          ),
          Image.asset(
              "images/aarnel.png",
              fit: BoxFit.fill
          ),
        ],
        itemExtent: 100,

      ),
    );
  }
}
