import 'package:credenz20/BottomNav/Contact.dart';
import 'package:credenz20/nav_pages/about_us.dart';
import 'package:credenz20/nav_pages/editprofile.dart';
import 'package:credenz20/nav_pages/myevents.dart';
import 'package:credenz20/nav_pages/ping.dart';
import 'package:credenz20/nav_pages/pisb.dart';
import 'package:credenz20/nav_pages/sponsors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
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
            child: Container(
              padding: EdgeInsets.fromLTRB(0,10,0,0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0,0,0,10),
                    child: DrawerHeader(
                        decoration: BoxDecoration(
                          //borderRadius: BorderRadius.only(topLeft: Radius.circular(2000),topRight: Radius.circular(2000),bottomLeft: Radius.circular(2000),bottomRight: Radius.circular(2000),),
                            image: DecorationImage(
                                image: AssetImage("images/icon.png"),
                                fit: BoxFit.contain
                            )
                        ),
                        child: SizedBox(width: MediaQuery.of(context).size.width-130,)
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      ListTile(
                        leading: Icon(Icons.favorite_border),
                        title: Text('PISB'),
                        onTap: () {
                          // Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => PISB()));
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.favorite_border),
                        title: Text('PING'),
                        onTap: () {
                          //Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => Ping()));
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.favorite_border),
                        title: Text('Sponsors'),
                        onTap: () {
                          //Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => Sponsors()));
                        },
                      ),
                      Divider(
                      ),
                      ListTile(
                        leading: Icon(Icons.favorite_border),
                        title: Text('My Events'),
                        onTap: () {
                          // Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => MyEvents()));
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.favorite_border),
                        title: Text('Edit Profile'),
                        onTap: () {
                          //Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => EditProfile()));
                        },
                      ),
                      Divider(
                      ),
                      ListTile(
                        leading: Icon(Icons.favorite_border),
                        title: Text('Contact Us'),
                        onTap: () {
                          //Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => Contact()));
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.favorite_border),
                        title: Text('Visit Website'),
                        onTap: () {

                        },
                      ),
                      Divider(
                      ),
                      ListTile(
                        leading: Icon(Icons.favorite_border),
                        title: Text('Privacy Policy'),
                        onTap: () {

                        },
                      ),
                      Divider(
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        SignInButton(
                            Buttons.Facebook,
                            mini: true,
                            onPressed: () {}
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        SignInButton(
                            Buttons.Pinterest,
                            mini: true,
                            onPressed: () {}
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        SignInButton(
                          Buttons.LinkedIn,
                          mini: true,
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        SignInButton(
                            Buttons.Twitter,
                            mini: true,
                            onPressed: () {}
                        ),
                      ]

                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


/*
import 'package:credenz20/models/nav_model.dart';
import 'package:credenz20/nav_pages/editprofile.dart';
import 'package:credenz20/nav_pages/myevents.dart';
import 'package:credenz20/nav_pages/pisb.dart';
import 'package:credenz20/nav_pages/sponsors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../nav_pages/ping.dart';
import '../theme.dart';
import 'collapsing_list_tile.dart';

class CollapsingNavDraw extends StatefulWidget {
  @override
  _CollapsingNavDrawState createState() => _CollapsingNavDrawState();
}

class _CollapsingNavDrawState extends State<CollapsingNavDraw> with SingleTickerProviderStateMixin{

  double maxwidth = 300;
  double minwidth = 60;
  bool isCollapsed=false;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  int currselected;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController= AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    widthAnimation=Tween<double>(begin: maxwidth, end: minwidth).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController, builder: (context, widget) => getWidget(context, widget),
    );
  }

  Widget getWidget(context, widget) {
    return Material(
      elevation: 60.0,
      child: Container(
        width: widthAnimation.value,
        color: drawerBackgroundColor,
        child: Column(
          children: <Widget>[

DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/unnamed.jpg"),
                    fit: BoxFit.cover),
              ),
            ),

            CollapsingListTile(
                animationController: _animationController, title: 'Credenz \'20', icon: Icons.person
            ),
            Divider(color: Colors.grey, height: AppBar().preferredSize.height/2,),
            Expanded(

              child: ListView.separated(

                itemBuilder: (context, counter){
                return CollapsingListTile(
                    onTap: () {
                      setState(() {
                        currselected = counter;
                      });

                      switch(counter)
                      {
                        case 0: Navigator.of(context).pop();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => Pisb())); break;
                        case 1: Navigator.of(context).pop();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => Ping())); break;
                        case 2: Navigator.of(context).pop();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => Sponsors())); break;
                        case 3: Navigator.of(context).pop();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => MyEvents())); break;
                        case 4: Navigator.of(context).pop();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => EditProfile())); break;
                      }
                    },
                    isSelected: currselected == counter,
                    title: navigationItems[counter].title,
                    icon: navigationItems[counter].icon,
                    animationController: _animationController,
                );
              },
                separatorBuilder: (context, counter) {
                  Widget wid;
                  (counter == 2 || counter == 4 || counter == 5 || counter == 6)
                      ? wid =  Divider(color: Colors.grey, height: AppBar().preferredSize.height/2,)
                      : wid =  Divider(height: AppBar().preferredSize.height/4,);
                  return wid;
                },
                itemCount: navigationItems.length,
              ),
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    isCollapsed=!isCollapsed;
                    isCollapsed
                        ? _animationController.forward()
                        : _animationController.reverse();
                  });
                },
                child: AnimatedIcon(
                  icon: AnimatedIcons.close_menu,
                  progress: _animationController,
                  color: Colors.white,
                  size: 50.0,
                )
            ),
            SizedBox(height: 50.0,),
          ],
        ),
      ),
    );
  }
}


import 'dart:math';

import 'package:credenz20/extra_lib/controller.dart';
import 'package:credenz20/commons/slide_drawer.dart';
import 'package:flutter/material.dart';

class FlipDrawer extends StatefulWidget {

  final String title;
  final Widget drawer;
  final Widget child;

  const FlipDrawer({Key key, this.title, this.drawer, this.child}) : super(key: key);

  static _FlipDrawerState of(BuildContext context) =>
      context.findAncestorStateOfType<_FlipDrawerState>();

  @override
  _FlipDrawerState createState() => _FlipDrawerState();
}

class _FlipDrawerState extends State<FlipDrawer>
    with TickerProviderStateMixin {

  final double _offsetFromRight = 60.0;
  bool _canBeDragged = false;

  CurvedAnimationController _animation;
  CurvedAnimationController _menuAnimation;

  double get _maxSlide => MediaQuery.of(context).size.width - _offsetFromRight;

  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animation.dispose();
    _menuAnimation.dispose();
    super.dispose();
  }

  _initAnimation() {
    _animation = CurvedAnimationController(
      vsync: this, duration: Duration(milliseconds: 250),
      curve: curve, // curve value from shared.dart
    );

    _menuAnimation = CurvedAnimationController(
      vsync: this, duration: Duration(milliseconds: 250),
      curve: curve,
    );

    _animation.addListener(() => setState(() {}));
    _menuAnimation.addListener(() => setState(() {}));
  }

  reset() {
    _initAnimation();
  }

  open() {
    _animation?.start();
    _menuAnimation?.start();
  }
  close() {
    _animation?.reverse();
    _menuAnimation?.reverse();
  }

  toggle() => _animation.isDismissed ? open() : close();

  _onDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft = _animation.isDismissed;
    bool isDragCloseFromRight = _animation.isCompleted;

    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  _onDragUpdate(DragUpdateDetails details) {
    if(_canBeDragged) {
      double delta = details.primaryDelta / _maxSlide;
      _animation.progress += delta;
      _menuAnimation.progress += delta;
    }
  }

  _onDragEnd(DragEndDetails details) {
    double _kMinFlingVelocity = 365.0;

    if (_animation.isDismissed || _animation.isCompleted) {
      return;
    }

    if (details.velocity.pixelsPerSecond.dx.abs() >= _kMinFlingVelocity) {
      double visualVelocity =
          details.velocity.pixelsPerSecond.dx / MediaQuery.of(context).size.width;
      _animation?.fling(velocity: visualVelocity);
      _menuAnimation?.fling(velocity: visualVelocity);

    } else if (_animation.progress < 0.5) {
      close();
    } else {
      open();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_animation.isCompleted) {
          close();
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: GestureDetector(
        onHorizontalDragStart: _onDragStart,
        onHorizontalDragUpdate: _onDragUpdate,
        onHorizontalDragEnd: _onDragEnd,
        behavior: HitTestBehavior.translucent,
        onTap: toggle,
        child: Material(
          color: Colors.teal[500],
          child: Stack(
            children: <Widget>[
              Transform(
                transform: Matrix4.identity()
                  ..translate(_maxSlide * (_animation.value - 1), 0.0),
                child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(pi / 2 * (1 - _animation.value)),
                  alignment: Alignment.centerRight,
                  child: widget.drawer,
                ),
              ),
              Transform(
                transform: Matrix4.identity()
                  ..translate(_maxSlide * _animation.value, 0.0),
                child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(-pi * _animation.value / 2),
                  alignment: Alignment.centerLeft,
                  child: widget.child,
                ),
              ),
              Positioned(
                top: 16.0 + MediaQuery.of(context).padding.top,
                left: _animation.value * MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  widget.title,
                  style: Theme.of(context).primaryTextTheme.headline6,
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                top: 4.0 + MediaQuery.of(context).padding.top,
                left: 4.0 + _animation.value * _maxSlide,
                child: IconButton(
                  icon: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    color: Colors.white,
                    progress: _menuAnimation.controller,
                  ),
                  onPressed: toggle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
