import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../theme.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  List<AssetImage> eventimages = [
    AssetImage('images/clash.png'),
    AssetImage('images/credenz13.png'),
    AssetImage('images/credenz13.png'),
    AssetImage('images/credenz13.png'),
    AssetImage('images/credenz13.png'),
    AssetImage('images/credenz13.png'),
    AssetImage('images/credenz13.png'),
    AssetImage('images/credenz13.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Padding(
        padding: const EdgeInsets.all(4),
        child: new StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) => new Container(
            color: drawerBackgroundColor,
            child: new Center(
              child:Container(
                width: 50,
                height: 50  ,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  image: DecorationImage(
                    // fit: BoxFit.fill,
                    image: AssetImage('images/credenz13.png'),
                  fit: BoxFit.cover,
                  ),

                ),
              )
              // child: new CircleAvatar(
              //   backgroundColor: Colors.transparent,
              //   // radius: 35,
              //   // backgroundImage: AssetImage("assets/images/example.jpeg"),
              //
              //   // backgroundImage: eventimages[index],
              //   child: new Image(
              //     image: AssetImage('images/credenz13.png'),
              //     fit: BoxFit.cover, //AssetImage(eventimages[0]),
              //   ),
              // ),
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
