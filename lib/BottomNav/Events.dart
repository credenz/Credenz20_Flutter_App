import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:credenz20/extra_lib/circle_wheel_renderx.dart';
import 'package:credenz20/extra_lib/circle_wheel_scroll_viewx.dart';
import '../constants/theme.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
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
        child: WheelExample(),
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

class WheelExample extends StatelessWidget {
  Widget _buildItem(int i) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 325,
            padding: EdgeInsets.all(20),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
          child: Container(
            // height: 260,
            // width: 160,
            child: CircleListScrollView(
              physics: CircleFixedExtentScrollPhysics(),
              axis: Axis.vertical,  
              itemExtent: 250,
              children: List.generate(12, _buildItem),
              radius: MediaQuery.of(context).size.width * 0.8,
              // onSelectedItemChanged: (int index) => print('Current index: $index'),
            ),
          ),
        ),
      );
  }
}