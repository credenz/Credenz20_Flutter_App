import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:credenz20/models/Event_Des_Model.dart';
import 'package:toast/toast.dart';

// import 'package:flutter_staggered_grid_view/.dart';
import 'package:credenz20/External_Package/circle_wheel_scroll_view.dart';

// import 'package:fluttertoast/fluttertoast.dart';
import '../constants/theme.dart';

class Events extends StatefulWidget {
  @override
  WheelExample createState() => WheelExample();
}

List<AssetImage> eventimages = [
  AssetImage('images/clash1.png'),
  AssetImage('images/contraption.png'),
  AssetImage('images/cretronix.png'),
  AssetImage('images/enigma.png'),
  AssetImage('images/datawizwhite.png'),
  AssetImage('images/nth.png'),
  AssetImage('images/paper.png'),
  AssetImage('images/pixelate.png'),
  AssetImage('images/quiz.png'),
  AssetImage('images/revb.png'),
  AssetImage('images/roboliga.png'),
  AssetImage('images/xodia.png'),
];

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Padding(
        padding: const EdgeInsets.all(4),
        // child: WheelExample(),
        // new StaggeredGridView.countBuilder(
        //   crossAxisCount: 4,
        //   itemCount: 12,
        //   itemBuilder: (BuildContext context, int index) => new Container(
        //     color: drawerBackgroundColor,
        //     child: Container(
        //       width: 10,
        //       height: 10,
        //       decoration: BoxDecoration(
        //         shape: BoxShape.circle,
        //
        //         image: DecorationImage(
        //           // fit: BoxFit.fill,
        //         image: eventimages[index],
        //         fit: BoxFit.fitHeight,
        //         ),
        //
        //       ),
        //     ),
        //   ),
        //   staggeredTileBuilder: (int index) =>
        //       new StaggeredTile.count(2, index.isEven ? 2 : 1),
        //   mainAxisSpacing: 4.0,
        //   crossAxisSpacing: 4.0,
        // ),
      ),
    );
  }
}

class WheelExample extends State<Events> {
  // var isselected = {new List(12).fill fillRange(0, 11,false)}; // = new List(12);
  List<bool> isselected = List.filled(12, false);
  int selectedcard;

  Widget _buildItem(int i) {
    return Center(
        child: isselected[i]
            ? ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 150,
                  height: 150,
                  color: drawerBackgroundColor,
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
                  width: 90,
                  height: 90,
                  // padding: EdgeInsets.all(20),
                  color: drawerBackgroundColor,
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
              ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: 260,
        // width: 160,
        child: InkWell(
          onTap: () {
            Toast.show('$selectedcard', context,
                duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EventDes()),
            );
          },
          child: CircleListScrollView(
            physics: CircleFixedExtentScrollPhysics(),
            axis: Axis.vertical,
            itemExtent: 150,
            children: List.generate(12, _buildItem),
            radius: MediaQuery.of(context).size.width * 0.7,
            onSelectedItemChanged: (int index) => _selectedItem(index, context),
          ),
        ),
      ),
    );
  }

  _selectedItem(int index, BuildContext context) {
    setState(() {
      selectedcard=index;
      isselected.fillRange(0, 11, false);
      isselected[index] = true;
    });

    /*
     child: InkWell(
              onTap: (){
                Toast.show('5', cardcontext, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                Navigator.push(
                  cardcontext,
                  MaterialPageRoute(builder: (cardcontext) => EventDes()),
                );
             }
             );
     */

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
