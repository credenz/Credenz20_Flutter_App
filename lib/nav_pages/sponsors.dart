import 'package:credenz20/constants/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Sponsors extends StatefulWidget {
  @override
  _SponsorsState createState() => _SponsorsState();
}



class _SponsorsState extends State<Sponsors> {
  List<AssetImage> images = [
    AssetImage("images/aarnel.png"),
    AssetImage("images/byju.jpg"),
    AssetImage("images/cc.jpg"),
    AssetImage("images/collegepond.jpg"),
    AssetImage("images/finiq.png"),

  ];

  Widget card(int index){
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.only(
                  topLeft:  const  Radius.circular(40.0),
                  topRight: const  Radius.circular(40.0),
                  bottomRight: const  Radius.circular(40.0),
                  bottomLeft: const  Radius.circular(40.0),),
                image: DecorationImage(
                    image:images[index],
                    fit: BoxFit.fill
                )
            ),
            child: SizedBox(width: MediaQuery.of(context).size.width-130,)
        ),
      ),
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: drawerBackgroundColor,
        title: Text("Sponsors"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          // gradient: LinearGradient(begin: FractionalOffset.topLeft, end: FractionalOffset.bottomRight, colors: [Color.fromRGBO(61, 17, 52, 10), Color.fromRGBO(26, 4, 43, 10)])
        ),
        child: ListWheelScrollView(
          children: [
            card(0),
            card(1),
            card(2),
            card(3),
            card(4),

          ],
          itemExtent: 300,
          diameterRatio: 4,
          physics: FixedExtentScrollPhysics(),


        ),
      ),
    );
  }
}
