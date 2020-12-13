import 'package:credenz20/constants/theme.dart';
import 'package:flutter/cupertino.dart';
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: FractionalOffset.topLeft, end: FractionalOffset.bottomRight, colors: [Color.fromRGBO(61, 17, 52, 10), Color.fromRGBO(26, 4, 43, 10)])
        ),
        child: ListWheelScrollView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: DecoratedBox(
                    decoration: BoxDecoration(
                    borderRadius: new BorderRadius.only(
                          topLeft:  const  Radius.circular(40.0),
                          topRight: const  Radius.circular(40.0),
                          bottomRight: const  Radius.circular(40.0),
                          bottomLeft: const  Radius.circular(40.0),),
                        image: DecorationImage(
                            image: AssetImage("images/aarnel.png"),
                            fit: BoxFit.fill
                        )
                    ),
                    child: SizedBox(width: MediaQuery.of(context).size.width-130,)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: new BorderRadius.only(
                          topLeft:  const  Radius.circular(40.0),
                          topRight: const  Radius.circular(40.0),
                          bottomRight: const  Radius.circular(40.0),
                          bottomLeft: const  Radius.circular(40.0),),
                      //borderRadius: BorderRadius.only(topLeft: Radius.circular(2000),topRight: Radius.circular(2000),bottomLeft: Radius.circular(2000),bottomRight: Radius.circular(2000),),
                        image: DecorationImage(
                            image: AssetImage("images/avaya.jpg"),
                            fit: BoxFit.fill
                        )
                    ),
                    child: SizedBox(width: MediaQuery.of(context).size.width-130,)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: new BorderRadius.only(
                          topLeft:  const  Radius.circular(40.0),
                          topRight: const  Radius.circular(40.0),
                          bottomRight: const  Radius.circular(40.0),
                          bottomLeft: const  Radius.circular(40.0),),
                      //borderRadius: BorderRadius.only(topLeft: Radius.circular(2000),topRight: Radius.circular(2000),bottomLeft: Radius.circular(2000),bottomRight: Radius.circular(2000),),
                        image: DecorationImage(
                            image: AssetImage("images/byju.jpg"),
                            fit: BoxFit.fill
                        )
                    ),
                    child: SizedBox(width: MediaQuery.of(context).size.width-130,)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: new BorderRadius.only(
                          topLeft:  const  Radius.circular(40.0),
                          topRight: const  Radius.circular(40.0),
                          bottomRight: const  Radius.circular(40.0),
                          bottomLeft: const  Radius.circular(40.0),),
                      //borderRadius: BorderRadius.only(topLeft: Radius.circular(2000),topRight: Radius.circular(2000),bottomLeft: Radius.circular(2000),bottomRight: Radius.circular(2000),),
                        image: DecorationImage(
                            image: AssetImage("images/cc.jpg"),
                            fit: BoxFit.fill
                        )
                    ),
                    child: SizedBox(width: MediaQuery.of(context).size.width-130,)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: new BorderRadius.only(
                          topLeft:  const  Radius.circular(40.0),
                          topRight: const  Radius.circular(40.0),
                          bottomRight: const  Radius.circular(40.0),
                          bottomLeft: const  Radius.circular(40.0),),
                      //borderRadius: BorderRadius.only(topLeft: Radius.circular(2000),topRight: Radius.circular(2000),bottomLeft: Radius.circular(2000),bottomRight: Radius.circular(2000),),
                        image: DecorationImage(
                            image: AssetImage("images/collegepond.jpg"),
                            fit: BoxFit.fill
                        )
                    ),
                    child: SizedBox(width: MediaQuery.of(context).size.width-130,)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: new BorderRadius.only(
                          topLeft:  const  Radius.circular(40.0),
                          topRight: const  Radius.circular(40.0),
                          bottomRight: const  Radius.circular(40.0),
                          bottomLeft: const  Radius.circular(40.0),),
                      //borderRadius: BorderRadius.only(topLeft: Radius.circular(2000),topRight: Radius.circular(2000),bottomLeft: Radius.circular(2000),bottomRight: Radius.circular(2000),),
                        image: DecorationImage(
                            image: AssetImage("images/finiq.png"),
                            fit: BoxFit.fill
                        )
                    ),
                    child: SizedBox(width: MediaQuery.of(context).size.width-130,)
                ),
              ),
            ),

          ],
          itemExtent: 240,


        ),
      ),
    );
  }
}
