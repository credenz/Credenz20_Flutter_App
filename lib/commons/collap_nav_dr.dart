import 'package:credenz20/commons/slide_drawer.dart';
import 'package:credenz20/loginPage.dart';
import 'package:credenz20/nav_pages/developers.dart';
import 'package:credenz20/nav_pages/myevents.dart';
import 'package:credenz20/nav_pages/ping.dart';
import 'package:credenz20/nav_pages/pisb.dart';
import 'package:credenz20/nav_pages/sponsors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Home.dart';

class MenuDrawer extends StatefulWidget {
  @override
  _MenuDrawerState createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  BoxDecoration get _gradient => BoxDecoration(
        // color: Color(0xff101010)
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 1],
            // colors: [Color(0xFF000000),Color(0xFF000000)]
            //colors: [Color(0xFF3d3251), Color(0xFF272034)]
            colors: [Color(0xff15171f), Color(0xff1d2556)]),
      );

  bool loggedin = false;
  final storage = FlutterSecureStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInfo();
  }

  getInfo() async {
    String accToken = await storage.read(key: 'accToken');
    if (accToken == null) {
      loggedin = false;
    } else {
      setState(() {
        loggedin = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.transparent,
      borderOnForeground: false,
      child: Container(
        decoration: _gradient,
        child: SafeArea(
          child: Theme(
            data: ThemeData(brightness: Brightness.dark),
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: MediaQuery.of(context).size.height),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 15, 15, 10),
                    child: DrawerHeader(
                        decoration: BoxDecoration(
                            //borderRadius: BorderRadius.only(topLeft: Radius.circular(2000),topRight: Radius.circular(2000),bottomLeft: Radius.circular(2000),bottomRight: Radius.circular(2000),),
                            image: DecorationImage(
                                image: AssetImage("images/drawerlogo.png"),
                                fit: BoxFit.fill)),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 130,
                        )),
                  ),
                  new Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: ListView(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          ListTile(
                            leading: Icon(Icons.collections_bookmark),
                            title: Text(
                              'PISB',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                              ),
                            ),
                            onTap: () {
                              // Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) => PISB()));
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.collections_bookmark),
                            title: Text('PING',
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                )),
                            onTap: () {
                              //Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) => Ping()));
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.monetization_on_rounded),
                            title: Text('Sponsors',
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                )),
                            onTap: () {
                              //Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Sponsors()));
                            },
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.wysiwyg),
                            title: Text('My Events',
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                )),
                            onTap: () {
                              // Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MyEvents()));
                            },
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.web_asset),
                            title: Text('Visit Website',
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                )),
                            onTap: () {
                              _launchURL('https://credenz.in/');
                              //Navigator.of(context).pop();
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.developer_mode_sharp),
                            title: Text('Developers',
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                )),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext cotext) =>
                                      Developer()));
                            },
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.policy),
                            title: Text('Privacy Policy',
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                )),
                            onTap: () {
                              _launchURL(
                                  'https://docs.google.com/document/d/1mRYU1bio4h2CDVA8HMBzUgcMX4Drhx9hKOuG0zmjiVU/edit?usp=sharing');
                            },
                          ),
                          Divider(),
                          loggedin
                              ? ListTile(
                                  leading: Icon(Icons.logout),
                                  title: Text('Logout',
                                      style: TextStyle(
                                        fontFamily: 'Segoe UI',
                                      )),
                                  onTap: () async {
                                    await storage.deleteAll();
                                    Fluttertoast.showToast(
                                        msg: 'Logged out',
                                        backgroundColor: Colors.blue.shade600);
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                SlideDrawer(
                                                    drawer: MenuDrawer(),
                                                    child: Home(
                                                        title:
                                                            "CREDENZ LIVE"))),
                                        (route) => false);
                                  },
                                )
                              : ListTile(
                                  leading: Icon(Icons.login),
                                  title: Text('Login',
                                      style: TextStyle(
                                        fontFamily: 'Segoe UI',
                                      )),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext cotext) =>
                                                Login()));
                                  },
                                ),
                          Divider(),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Row(children: [
                      SizedBox(
                        width: 30,
                      ),
                      SignInButton(Buttons.Facebook,
                          mini: true,
                          //elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ), onPressed: () {
                        _launchURL('https://www.facebook.com/pisbcredenz');
                      }),
                      SizedBox(
                        width: 30,
                      ),
                      new GestureDetector(
                        onTap: () {
                          _launchURL('https://www.instagram.com/pisbcredenz/');
                        },
                        child: Container(
                          child: Image(
                            image: AssetImage("images/instagram.png"),
                            height: 35,
                            width: 35,
                          ),
                          decoration: BoxDecoration(
                              // color: Colors.red,
                              // image:DecorationImage(
                              //   image:,
                              //
                              // ),
                              shape: BoxShape.circle),
                        ),
                      ),
                      // SignInButton(
                      //     Buttons.Pinterest,
                      //     mini: true,
                      //     elevation: 10,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(32.0),
                      //     ),    onPressed: () {}
                      // ),
                      SizedBox(
                        width: 30,
                      ),
                      SignInButton(
                        Buttons.LinkedIn,
                        mini: true,
                        //elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        onPressed: () {
                          _launchURL(
                              'https://www.linkedin.com/company/pisbieee/');
                        },
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      SignInButton(Buttons.Twitter,
                          mini: true,
                          //elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ), onPressed: () {
                        _launchURL('https://twitter.com/pisbcredenz');
                      }),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

_launchURL(var url) {
    launch(url);
}
