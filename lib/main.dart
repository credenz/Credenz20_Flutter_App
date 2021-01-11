import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:credenz20/size_config.dart';
import 'package:credenz20/commons/collap_nav_dr.dart';
import 'package:splashscreen/splashscreen.dart';
import 'Home.dart';
import 'commons/slide_drawer.dart';

void main() {
  runApp(MyApp());
}
class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      imageBackground: AssetImage("gifs/preloader2.gif", ),
      navigateAfterSeconds: new SlideDrawer(drawer: MenuDrawer(), child: Home(title: "Credenz \'21")),
      //title: new Text('Credenz Live',textScaleFactor: 2,style: Te,),
      /*image: new Image.asset("gifs/preloader.gif",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,),*/
      useLoader: false,
      //loadingText: Text("Loading"),
      photoSize: MediaQuery.of(context).size.width*3/5,
      //loaderColor: Colors.blue,
    );
  }
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
      home: Splash2(),

    );
  }
}





