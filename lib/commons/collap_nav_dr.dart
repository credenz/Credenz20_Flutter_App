import 'package:credenz20/models/nav_model.dart';
import 'package:credenz20/nav_pages/editprofile.dart';
import 'package:credenz20/nav_pages/myevents.dart';
import 'package:credenz20/nav_pages/pisb.dart';
import 'package:credenz20/nav_pages/sponsors.dart';
import 'package:flutter/material.dart';

import '../nav_pages/ping.dart';
import '../theme.dart';
import 'collapsing_list_tile.dart';

class CollapsingNavDraw extends StatefulWidget {
  @override
  _CollapsingNavDrawState createState() => _CollapsingNavDrawState();
}

class _CollapsingNavDrawState extends State<CollapsingNavDraw> with SingleTickerProviderStateMixin{

  double maxwidth = 240;
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
      elevation: 80.0,
      child: Container(
        width: widthAnimation.value,
        color: drawerBackgroundColor,
        child: Column(
          children: <Widget>[
            SizedBox(height: AppBar().preferredSize.height,),
            CollapsingListTile(
              title: 'Credenz \' 20',
              icon: Icons.person,
              animationController: _animationController,
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
