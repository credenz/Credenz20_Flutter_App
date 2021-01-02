import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

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
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("DEVELOPERS"),
      ),
      body: Stack(
        children: [
          Container(

            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/ballonback01.jpg"),
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
  "images/vaibhav.png",
  "images/tanuj.jpg",
  "images/durvesh.jpg",
];

List<String> name = [
  "Atharva Saraf",
  "Vaibhav Pallod",
  "Tanuj Agarwal",
  "Durvesh Malpure",
];
List<String> position = [
  "App head",
  "App head",
  "App head",
  "Joint Secretary",
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
        shadowColor: Colors.black,
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
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            name[x],
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Roboto Medium',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
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
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
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
                                  icon: Image.asset('images/call.png'),
                                  onPressed: null),
                              IconButton(
                                  iconSize: 55.0,
                                  icon: Image.asset('images/linkdin.png'),
                                  onPressed: null),
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
