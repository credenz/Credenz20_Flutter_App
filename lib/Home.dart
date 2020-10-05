import 'package:flutter/material.dart';

import 'BottomNav/About.dart';
import 'BottomNav/Contact.dart';
import 'BottomNav/Noti.dart';
import 'BottomNav/Profile.dart';
import 'commons/collap_nav_dr.dart';
import 'theme.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _counter = 0;
  int currentTab=0;

  final List<Widget> screens = [
    Profile(),
    About(),
    Contact(),
    Noti(),
  ];

  Widget currentScreen =Contact() ;//
  final PageStorageBucket bucket = PageStorageBucket();
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //Tanuj's Code
      appBar: AppBar(
        centerTitle: true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: drawerBackgroundColor,
        title: Text(widget.title),

      ),
      drawer: CollapsingNavDraw(),

      //Vaibhav's Code

      /* body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
*/
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.all_inclusive),
        tooltip: 'Increment',
        elevation: 2.0,
        backgroundColor: drawerBackgroundColor,
        onPressed: (){
          setState(() {
            currentScreen=Profile();
            currentTab = 0;
          },
          );
        },

      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(

        notchMargin: 7,
        shape: CircularNotchedRectangle(),

        child: Container(

            height: 60,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Row(
                //   children: <Widget>[
                    MaterialButton(

                      // minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen=Profile();
                          currentTab = 0;
                        },
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.group,color: currentTab ==0 ? drawerBackgroundColor:Colors.grey[500]),
                          Text('Profile',style: TextStyle(color: currentTab ==0 ? drawerBackgroundColor:Colors.grey[500],
                          ),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      // minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen=About();
                          currentTab = 2;
                        },);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.perm_contact_calendar,color: currentTab ==2 ? drawerBackgroundColor:Colors.grey[500]),
                          Text('Contact',style: TextStyle(color: currentTab ==2 ? drawerBackgroundColor:Colors.grey[500]),
                          ),
                        ],
                      ),
                    ),
                Expanded(flex: 1,
                  child: SizedBox(),

                ),
                //   ],
                // ),
                // Spacer(flex: 1,),
                // SizedBox(width: 70,),
                // Row(
                //   // mainAxisSize: MainAxisSize.max,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: <Widget>[
                    MaterialButton(
                      // minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen=About();
                          currentTab = 1;
                        },);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.info_outline,color: currentTab ==1 ? drawerBackgroundColor:Colors.grey[500]),
                          Text('About',style: TextStyle(color: currentTab ==1 ? drawerBackgroundColor:Colors.grey[500],
                          ),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      // minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen=Noti();
                          currentTab = 3;
                        },);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.notifications,color: currentTab ==3 ? drawerBackgroundColor:Colors.grey[500]),
                          Text('Notification',style: TextStyle(color: currentTab ==3 ? drawerBackgroundColor:Colors.grey[500],
                          ),
                          )
                        ],
                      ),
                    ),
                //   ],
                // )

              ],
            )
        ),

      ),



    );
  }
}
