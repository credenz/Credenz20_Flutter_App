import 'package:credenz20/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Home.dart';
import 'commons/flipped_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
      ),
      home: SlideDrawer(drawer: MenuDrawer(), child: Home(title: "Credenz \'20")),

    );
  }
}

class MenuDrawer extends StatelessWidget {

  BoxDecoration get _gradient => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.0, 1.0],

        colors: [Color(0xFF3d3251), Color(0xFF272034)]
    ),
  );



  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.transparent,
      borderOnForeground: false,
      child: Container(
        decoration: _gradient ,
        child: SafeArea(
          child: Theme(
            data: ThemeData(brightness: Brightness.dark),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0,0,0,10),
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      //borderRadius: BorderRadius.only(topLeft: Radius.circular(2000),topRight: Radius.circular(2000),bottomLeft: Radius.circular(2000),bottomRight: Radius.circular(2000),),
                        image: DecorationImage(
                            image: AssetImage("lib/images/icon.jpg"),
                            fit: BoxFit.contain
                        )
                    ),
                    child: SizedBox(width: MediaQuery.of(context).size.width-130,)
                  ),
                ),

                ListTile(
                  leading: Icon(Icons.favorite_border),
                  title: Text('About Us'),
                ),
                ListTile(
                  leading: Icon(Icons.favorite_border),
                  title: Text('PISB'),
                ),
                ListTile(
                  leading: Icon(Icons.favorite_border),
                  title: Text('PING'),
                ),
                ListTile(
                  leading: Icon(Icons.favorite_border),
                  title: Text('Sponsors'),
                ),
                ListTile(
                  leading: Icon(Icons.favorite_border),
                  title: Text('Contact Us'),
                ),
                ListTile(
                  leading: Icon(Icons.favorite_border),
                  title: Text('My Events'),
                ),
                ListTile(
                  leading: Icon(Icons.favorite_border),
                  title: Text('Edit Profile'),
                ),
                ListTile(
                  leading: Icon(Icons.favorite_border),
                  title: Text('Visit Website'),
                ),
                ListTile(
                  leading: Icon(Icons.favorite_border),
                  title: Text('Privacy Policy'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


