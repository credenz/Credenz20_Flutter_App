import 'package:flutter/material.dart';
import 'dart:math';
import 'package:credenz20/constants/theme.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,

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
  "images/litke.jpg",
  "images/durvesh.jpg",
  "images/rohan.jpg",

];

List<String> name = [
  "Onkar Litke",
  "Durvesh Malpure",
  "Rohan Pawar",

];

List<String> position = [
  "Vice Chairperson",
  "Joint Secretary",
  "Vice Treasurer"
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
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Color(0x22000000),
                spreadRadius: 5,
                blurRadius: 20,
              )
            ]),
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
                        color: Color(0x66000000),
                        spreadRadius: 5,
                        blurRadius: 20,
                      )
                    ]),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Text(
                            name[x],
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Roboto Medium',
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
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
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                  iconSize: 42.0,
                                  icon: Image.asset('images/mail.png'),
                                  onPressed: null),

                              IconButton(
                                  iconSize: 42.0,
                                  icon: Image.asset('images/call.png'),
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

