import 'package:credenz20/constants/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Sponsors extends StatefulWidget {
  @override
  _SponsorsState createState() => _SponsorsState();
}



class _SponsorsState extends State<Sponsors> {
  List<String> images = [
    /*AssetImage("images/aarnel.png"),
    AssetImage("images/byju.jpg"),
    AssetImage("images/cc.jpg"),
    AssetImage("images/collegepond.jpg"),
    AssetImage("images/finiq.png"),*/
    "images/aarnel.png",
    "images/byju.jpg",
    "images/cc.jpg",
    "images/collegepond.jpg",
    "images/finiq.png",

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
                      blurRadius: 20,
                      color: Colors.grey.withOpacity(0.5),
                    )
                  ],
                ),
                child: CircleAvatar(
                  radius: 300,
                  backgroundColor: Colors.white,
                  //backgroundImage: AssetImage("images/aarnel.png"),
                  child: ClipOval(child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(images[index]),
                  )),
                ),
              ),
            ),
            Text("Sponsor", style: TextStyle(fontSize: 30),)
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
                    fit: BoxFit.contain
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primary,
        title: Text("Sponsors"),
      ),
      body: Container(
        decoration: BoxDecoration(
          /*gradient:  LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [0.25, 2.5],
              // colors: [Color(0xFF000000),Color(0xFF000000)]
              //colors: [Color(0xFF3d3251), Color(0xFF272034)]
              colors: [Color(0xff4e50bc),Color(0xff55c2fc)]

          ),*/
          color: Colors.white
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
          itemExtent: 500,
          diameterRatio: 3,
          physics: FixedExtentScrollPhysics(),


        ),
      ),
    );
  }
}