import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Developer extends StatefulWidget {
  @override
  _DeveloperState createState() => _DeveloperState();
}

class _DeveloperState extends State<Developer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light,statusBarColor:Colors.transparent),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("DEVELOPERS", style: TextStyle(fontFamily: 'Segoe UI',),),
      ),
      body: Stack(
        children: [
          Container(

            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/conb.jpg"),
                // <-- BACKGROUND IMAGE
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + kToolbarHeight,
                left: 40,
              )),
              Expanded(
                child: PageViewWidget(),
              )

              /*
              PageView(

                children: <Widget>[
                  Container(
                    child: card,
                  ),
                  Container(
                    child: card,
                  ),
                  Container(
                    child: card,
                  ),
                ],
              ),*/
            ],
          ),
        ],
      ),
    );
  }
}

class PageViewWidget extends StatefulWidget {
  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

List<String> profilepic = [
  "images/atharva.jpg",
  "images/vaibhav.jpg",
  "images/tanuj.jpg",
  "images/durvesh.jpg",
];

List<String> name = [
  "Atharva Saraf",
  "Vaibhav Pallod",
  "Tanuj Agarwal",
  "Durvesh Malpure",
];

List<String> number = [
  "+91-7397865565",
  "+91-9422668223",
  "+91-9423929049",
  "+91-9405234240",
];

List<String> linkedin = [
  "https://www.linkedin.com/in/atharvasaraf/",
  "linkedin.com/in/vaibhav-pallod-556ba51a3/",
  "https://www.linkedin.com/in/tanuj-agrawal-83320516b/",
  "https://www.linkedin.com/in/durvesh-malpure-103388193/",
];

List<String> email = [
  "https://github.com/atharvasaraf123",
  "https://github.com/vaibhavpallod",
  "https://github.com/tanuj223",
  "https://github.com/durvesh8",
];

List<String> position = [
  "App head",
  "App head",
  "App head",
  "App Team",
];

class _PageViewWidgetState extends State<PageViewWidget> {
  PageController pageController;
  double viewportFraction = 0.8;
  double pageOffset = 0;
  int profileindex = 0;

  @override
  void initState() {
    super.initState();
    pageController =
        PageController(initialPage: 0, viewportFraction: viewportFraction)
          ..addListener(() {
            setState(() {
              pageOffset = pageController.page;
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    Widget card(int x) {
      return Card(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        elevation: 10,
        child: Center(
          child: Container(
            // height: MediaQuery.of(context).size.height,
            // decoration: BoxDecoration(boxShadow: [
            //   BoxShadow(
            //     color: Color(0x22000000),
            //     spreadRadius: 5,
            //     blurRadius: 20,
            //   )
            // ]),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height/3.5,
                    child: Image(
                      height: MediaQuery.of(context).size.height/3.5,
                      width: MediaQuery.of(context).size.width/2.1,
                      image: AssetImage(
                        profilepic[x],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Color(0x55000000),
                        spreadRadius: 5,
                        blurRadius: 20,
                      )
                    ]),
                    child:ListView(
                      // shrinkWrap: true,
                      padding: EdgeInsets.all(0.0),
                      // mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text(
                              name[x],
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Segoe UI',
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        /*Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              position[x],
                              style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'Roboto Medium',
                                color: Colors.white,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ),
                        ),*/
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // IconButton(
                              //     iconSize: 42.0,
                              //     icon: Image.asset('images/mail.png'),
                              //     onPressed: null),
                              // IconButton(
                              //     iconSize: 55.0,
                              //     icon: Image.asset('images/fb.png'),
                              //     onPressed: null),
                              IconButton(
                                  iconSize: 42.0,
                                  icon: Image.asset('images/github.png'),
                                  onPressed:  () => _launchURL(email[x].toString())),
                              IconButton(
                                  iconSize: 42.0,
                                  icon: Image.asset('images/call.png'),
                                  onPressed: () => _launchURL("tel://"+number[x].substring(4))),
                              IconButton(
                                  iconSize: 55.0,
                                  icon: Image.asset('images/linkdin.png'),
                                  onPressed: () => _launchURL(linkedin[x].toString()),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    ;

    return PageView.builder(
      controller: pageController,
      itemBuilder: (context, index) {
        profileindex = index;
        double scale = max(viewportFraction,
            (1 - (pageOffset - index).abs()) + viewportFraction);

        double angle = (pageOffset - index).abs();

        if (angle > 0.5) {
          angle = 1 - angle;
        }
        return Container(
          padding: EdgeInsets.only(
            right: 0,
            left: 0,
            top: 50 - scale * 25,
            bottom: 50,
          ),
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(
                3,
                2,
                0.001,
              )
              ..rotateY(angle),
            alignment: Alignment.center,
            child: Stack(
              children: <Widget>[
                // card(index),
                Positioned.fill(
                  child: Align(
                      alignment: Alignment.center,
                      child: card(index)),
                )
              ],
            ),
          ),
        );
      },
      itemCount: profilepic.length,
    );
  }
}

_launchURL(var url) async {

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

/*
class VacationBean {
  String url;
  String name;

  VacationBean(this.url, this.name);

  static List<VacationBean> generate() {
    return [

    ];
  }
}*/
