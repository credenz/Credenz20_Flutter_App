import 'package:flutter/material.dart';

import 'BottomNav/About.dart';
import 'BottomNav/Contact.dart';
import 'BottomNav/Events.dart';
import 'BottomNav/Noti.dart';
import 'BottomNav/Profile.dart';
import 'Cart.dart';
import 'commons/slide_drawer.dart';
import 'package:credenz20/size_config.dart';
import 'constants/theme.dart';

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
  int currentTab = 2;

  final List<Widget> screens = [
    Profile(),
    About(),
    ContactUs(),
    Noti(),
  ];

  Widget currentScreen = Events(); //
  final PageStorageBucket bucket = PageStorageBucket();
  int currentIndex = 2;
  PageController pageController;

  List<Widget> tabPages = [
    new Profile(),
    new ContactUs(),
    new Events(),
    new About(),
    new Noti(),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

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

  void onPageChanged(int page) {
    setState(() {
      this.currentIndex = page;
    });
  }

  // void onTabTapped(int index) {
  //   this.pageController.animateToPage(index,
  //       duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  // }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      //Tanuj's Code
      /*appBar: AppBar(
        centerTitle: true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: drawerBackgroundColor,
        title: Text(widget.title),*/
      appBar: AppBar(
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => SlideDrawer.of(context)?.toggle(),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Login()));
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) => Cart()));
              // do something
            },
          )
        ],
        title: Text(widget.title),
        backgroundColor: Colors.black,
      ),
      //drawer: FlipDrawer(),

      //Vaibhav's Code

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.all_inclusive,color: Colors.black,),
        tooltip: 'Increment',
        elevation: 2.0,
        backgroundColor: Colors.white,
        onPressed: () {
          setState(
            () {
              // onTabTapped(2);
              currentScreen = Events();
              currentTab = 2;
            },
          );
        },
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: currentScreen,

      // new IndexedStack(
      //   index: currentIndex,
      //   children: <Widget>[
      //     new Profile(),
      //     new Contact(),
      //     new Events(),
      //     new About(),
      //     new Noti(),
      //   ],
      // ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
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
                Expanded(
                  child: MaterialButton(
                    // minWidth: 40,
                    onPressed: () {
                      setState(
                        () {
                          // onTabTapped(0);
                          currentScreen = Profile();
                          currentTab = 0;
                        },
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.group,
                            color: currentTab == 0
                                ? Colors.white
                                : Colors.grey[500]),
                        Text(
                          'Profile',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: currentTab == 0
                                ? Colors.white
                                : Colors.grey[500],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    // minWidth: 40,
                    onPressed: () {
                      setState(
                        () {
                          // onTabTapped(1);
                          currentScreen = ContactUs();
                          currentTab = 1;
                        },
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.perm_contact_calendar,
                            color: currentTab == 1
                                ? Colors.white
                                : Colors.grey[500]),
                        Text(
                          'Contact',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: currentTab == 1
                                  ? Colors.white
                                  : Colors.grey[500]),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
            
                Expanded(
                  child: MaterialButton(
                    // minWidth: 40,
                    onPressed: () {
                      setState(
                        () {
                          // onTabTapped(3);
                          currentScreen = About();
                          currentTab = 3;
                        },
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.info_outline,
                            color: currentTab == 3
                                ? Colors.white
                                : Colors.grey[500]),
                        Text(
                          'About',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: currentTab == 3
                                ? Colors.white
                                : Colors.grey[500],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    // minWidth: 40,
                    onPressed: () {
                      setState(
                        () {
                          // onTabTapped(4);
                          currentScreen = Noti();
                          currentTab = 4;
                        },
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.notifications,
                            color: currentTab == 4
                                ? Colors.white
                                : Colors.grey[500]),
                        Text(
                          'News',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: currentTab == 4
                                ? Colors.white
                                : Colors.grey[500],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //   ],
                // )
              ],
            )),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';

import 'BottomNav/About.dart';
import 'BottomNav/Contact.dart';
import 'BottomNav/Noti.dart';
import 'BottomNav/Profile.dart';
import 'commons/slide_drawer.dart';
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
  int currentTab = 0;

  final List<Widget> screens = [
    Profile(),
    About(),
    Contact(),
    Noti(),
  ];

  Widget currentScreen = Contact(); //
  final PageStorageBucket bucket = PageStorageBucket();
  int currentIndex = 0;

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
      */
/*appBar: AppBar(
        centerTitle: true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: drawerBackgroundColor,
        title: Text(widget.title),*/ /*

        appBar : AppBar(
          centerTitle: true,
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => SlideDrawer.of(context)?.toggle(),
              );
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
          title: Text(widget.title),
          backgroundColor: drawerBackgroundColor,
        ),
      //drawer: FlipDrawer(),

      //Vaibhav's Code



      bottomNavigationBar: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            child: ClipPath(
              clipper: NavBarClipper(),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF3d3251), Color(0xFF272034)])),
              ),
            ),
          ),
          Positioned(
            bottom: 45,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // builNavItems(Icons.group,false),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentTab=0;
                    });
                  },
                  child: CircleAvatar(
                    radius: 30,

                    backgroundColor: Color(0xFF272034),
                    child: CircleAvatar(

                      radius: 25,
                      backgroundColor: currentTab==0
                          ? Colors.white.withOpacity(0.9)
                          : Colors.transparent,
                      child: Icon(Icons.group, color: currentTab==0 ? Colors.black : Colors.white.withOpacity(0.9)),
                    ),
                  ),
                ),

                SizedBox(
                  width: 1,
                ),
                //builNavItems(Icons.all_inclusive,true),
                InkWell(
                  onTap:() {
                    setState(() {
                      currentTab=1;

                    });
                  },
                  child: CircleAvatar(

                    radius: 30,
                    backgroundColor: Color(0xFF272034),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: currentTab==1 ? Colors.white.withOpacity(0.9): Colors.transparent,
                      child: Icon(Icons.all_inclusive, color: currentTab==1 ? Colors.black : Colors.white.withOpacity(0.9)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 1,
                ),
                //builNavItems(Icons.notifications,false),
                InkWell(
                  onTap: (){
                    setState(() {
                      currentTab=2;
                    });
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFF272034),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: currentTab == 2 ? Colors.white.withOpacity(0.9) : Colors.transparent,
                      child: Icon(Icons.notifications,color: currentTab==2 ? Colors.black : Colors.white.withOpacity(0.9)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Profile',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 1,
                ),
                Text(
                  'Home',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 1,
                ),
                Text(
                  'News',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  builNavItems(IconData icon, bool active) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Color(0xFF272034),
      child: CircleAvatar(
        radius: 25,
        backgroundColor:
            active ? Colors.white.withOpacity(0.9) : Colors.transparent,
        child: Icon(icon,
            color: active ? Colors.black : Colors.white.withOpacity(0.9)),
      ),
    );
  }


}

class NavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;

    path.cubicTo(sw / 12, 0, sw / 12, 2 * sh / 5, 2 * sw / 12, 2 * sh / 5);
    path.cubicTo(3 * sw / 12, 2 * sh / 5, 3 * sw / 12, 0, 4 * sw / 12, 0);
    path.cubicTo(
        5 * sw / 12, 0, 5 * sw / 12, 2 * sh / 5, 6 * sw / 12, 2 * sh / 5);
    path.cubicTo(7 * sw / 12, 2 * sh / 5, 7 * sw / 12, 0, 8 * sw / 12, 0);
    path.cubicTo(
        9 * sw / 12, 0, 9 * sw / 12, 2 * sh / 5, 10 * sw / 12, 2 * sh / 5);
    path.cubicTo(11 * sw / 12, 2 * sh / 5, 11 * sw / 12, 0, sw, 0);

    path.lineTo(sw, sh);
    path.lineTo(0, sh);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
*/
