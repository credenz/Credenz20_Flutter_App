// import 'package:flutter_staggered_grid_view/.dart';
import 'package:credenz20/External_Package/circle_wheel_scroll_view.dart';
import 'package:credenz20/constants/EventData.dart';
import 'package:credenz20/models/Event_Des_Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'package:fluttertoast/fluttertoast.dart';
import '../constants/theme.dart';

class Events extends StatefulWidget {
  bool animate;

  Events(bool animate){
    this.animate=animate;
  }

  @override
  WheelExample createState() => WheelExample();
}

class WheelExample extends State<Events> {
  // var isselected = {new List(12).fill fillRange(0, 11,false)}; // = new List(12);
  List<bool> isselected = List.filled(12, false);
  int selectedcard, flag = 0;
  BuildContext selectedBuildContext;

  Widget _buildItem(int i) {
    return InkWell(
        child: Center(
          child: isselected[i]
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      boxShadow: [
                      BoxShadow(
                      color: Colors.black,
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset: Offset(2.0, 2.0), // shadow direction: bottom right
                    )
                      ],

                      // color: Color(0xff101010)
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          stops: [0.25, 0.75],
                          // colors: [Color(0xFF000000),Color(0xFF000000)]
                          //colors: [Color(0xFF3d3251), Color(0xFF272034)]
                          colors:commonGradient,
                      ),
                    ),
                    //color: drawerBackgroundColor,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: eventimages[i],
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Container(
                    width: 80,
                    height: 80,
                    // padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      // color: Color(0xff101010)
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          stops: [0.25,0.75],
                          // colors: [Color(0xFF000000),Color(0xFF000000)]
                          //colors: [Color(0xFF3d3251), Color(0xFF272034)]
                          colors: commonGradient,
                      ),
                    ),
                    //color: drawerBackgroundColor,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: eventimages[i],
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                ),
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    (flag == 0) ? _selectedItem(0, context) : null;
  }

  @override
  Widget build(BuildContext context) {
    double x = 10;
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Material(
        child: Stack(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black,
                ),

                Image.asset(
                  // "images/enigma.png",
                  "images/app_design6.png",
                  // "gifs/homeback.gif",
                  height: MediaQuery.of(this.context).size.height,
                  width: MediaQuery.of(this.context).size.width,
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
            /*Center(
              child: Container(
                  alignment: Alignment.centerLeft,
                  // padding: EdgeInsets.fromLTRB(
                  //     10,
                  //     MediaQuery.of(context).size.height / 4 + 60,
                  //     MediaQuery.of(context).size.width / 2,
                  //     MediaQuery.of(context).size.height / 4),
                  child: Image.asset("images/crewhite.png",
                      width: 170, height: 170, fit: BoxFit.fitWidth)),
            ),*/
            Container(
              // height: 260,
              // width: 160,
              child: CircleListScrollView(
                animate: widget.animate,
                physics: CircleFixedExtentScrollPhysics(),
                axis: Axis.vertical,
                itemExtent: 150,
                children: List.generate(12, _buildItem),
                radius: MediaQuery.of(context).size.width * 0.7,
                onSelectedItemChanged: (int index) =>
                    _selectedItem(index, context),
                onMetricsChanged: (ScrollNotification noti) =>
                    _customNoti(noti),
                onTap: (int tap_index) => _get_tap(tap_index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _get_tap(int index) {
    // Toast.show('$index', context,textColor: Colors.blue,
    //     duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM,backgroundColor: Colors.white);
    if (index != -1)
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EventDes(
                  eventIndex: index,
                )),
      );
  }

  _customNoti(ScrollNotification noti) {
    print("HOme Screen\n" + noti.toString());
  }

  _selectedItem(int index, BuildContext context) {
    setState(() {
      selectedBuildContext = context;
      selectedcard = index;
      isselected.fillRange(0, 12, false);
      flag = 1;
      isselected[index] = true;
    });

/*    Fluttertoast.showToast(
        msg: isselected.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 12.0);*/

    /* return Center(
     child: ClipRRect(
       borderRadius: BorderRadius.circular(20),
       child: Container(
         width: 325,
         height: 100,
         padding: EdgeInsets.all(20),
         color: drawerBackgroundColor,
         child: Container(
           decoration: BoxDecoration(
             shape: BoxShape.circle,
             image: DecorationImage(
               image: eventimages[index],
               fit: BoxFit.fitHeight,
             ),
           ),
         ),
       ),
     ),
   );*/
  }
}
