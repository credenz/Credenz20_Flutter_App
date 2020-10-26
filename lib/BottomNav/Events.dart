import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../constants/theme.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Padding(
        padding: const EdgeInsets.all(4),
        child: new StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) => new Container(
            color: drawerBackgroundColor,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,

                image: DecorationImage(
                  // fit: BoxFit.fill,
                image: eventimages[index],
                fit: BoxFit.fitHeight,
                ),

              ),
            ),
          ),
          staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(2, index.isEven ? 2 : 1),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
      ),
    );
  }
}
