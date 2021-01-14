import 'package:credenz20/External_Package/RaisedGradientButton.dart';
import 'package:credenz20/constants/theme.dart';
import 'package:credenz20/extra_lib/modified_slimy_card.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PISB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PISB"),
        //centerTitle: true,
        backgroundColor: primary,
      ),
      body: AboutPISB(),
    );
  }
}

class AboutPISB extends StatefulWidget {
  @override
  _AboutPISBState createState() => _AboutPISBState();
}

class _AboutPISBState extends State<AboutPISB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: StreamBuilder(
          // This streamBuilder reads the real-time status of SlimyCard.
          initialData: true,
          stream: slimyCard.stream, //Stream of SlimyCard
          builder: ((BuildContext context, AsyncSnapshot snapshot) {
            return ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                topCardWidget(),
                bottomCardWidget(),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: RaisedGradientButton(
                      height: 35.0,
                      width: 160.0,
                      child: Text("Visit our website",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              // decoration: TextDecoration.underline,
                              color: Colors.white,
                              fontSize: 15.0)),
                      gradient: LinearGradient(
                        colors: commonGradient,//<Color>[Color(0xff4e50bc), Color(0xff55c2fc)],
                      ),
                      onPressed: () {
                        launch('http://pictieee.in/');
                      },
                    ),
                  ),
                ),

                // SlimyCard is being called here.

                /*SlimyCard(
                  // In topCardWidget below, imagePath changes according to the
                  // status of the SlimyCard(snapshot.data).
                  width: 450,
                  color: drawerBackgroundColor,
                  topCardHeight: 320,
                  bottomCardHeight: 350,
                  topCardWidget: topCardWidget(),
                  bottomCardWidget: bottomCardWidget(),
                  slimeEnabled: false,
                ),*/
              ],
            );
          }),
        ),
      ),
    );
  }

  // This widget will be passed as Top Card's Widget.
  Widget topCardWidget() {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 15),
        /*Text(
          "PICT IEEE Student Branch\n",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
          maxLines: 2,
        ),*/
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            // Image goes here
            height: 70,
            // width: 500,
            decoration: BoxDecoration(
              color: backColor,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: AssetImage(
                    'images/logopisb.png',
                  ),
                  fit: BoxFit.fitHeight),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 55),
      ],
    );
  }

  // This widget will be passed as Bottom Card's Widget.
  Widget bottomCardWidget() {
    return RichText(
      text: TextSpan(
        text:
            "PICT IEEE Student Branch (PISB) was established in the year 1988 with an aim of inculcating a sense of technical awareness amongst its student members. PISB aims to escalate the knowledge and trends in the diverse fields of technologies amongst its members. PISB upholds two major events every year - Credenz and Credenz Tech Dayz with the first one being conducted in odd semester and the latter one in even semester. PISB is also marked by its Women in Engineering (WIE) chapter, an initiative for empowerment of women.",
        style: TextStyle(
          color: textColor,
          fontSize: 21,
          fontWeight: FontWeight.w600,
        ),
      ),
      textAlign: TextAlign.justify,
    );
  }
}
