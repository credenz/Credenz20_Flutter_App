import 'package:credenz20/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:credenz20/extra_lib/modified_slimy_card.dart';


class PISB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PISB"),
        backgroundColor: drawerBackgroundColor,
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
      backgroundColor: drawerBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: StreamBuilder(
          // This streamBuilder reads the real-time status of SlimyCard.
          initialData: true,
          stream: slimyCard.stream, //Stream of SlimyCard
          builder: ((BuildContext context, AsyncSnapshot snapshot) {
            return ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                SizedBox(height: 15),
                topCardWidget(),
                bottomCardWidget(),
                // SlimyCard is being called here.

                // SlimyCard(
                //   // In topCardWidget below, imagePath changes according to the
                //   // status of the SlimyCard(snapshot.data).
                //   width: 450,
                //   color: drawerBackgroundColor,
                //   topCardHeight: 300,
                //   bottomCardHeight: 350,
                //   topCardWidget: topCardWidget(),
                //   bottomCardWidget: bottomCardWidget(),
                //   slimeEnabled: false,
                // ),
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(  // Image goes here
            height: 200,
            // width: 500,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(image: AssetImage('images/pisb-colour.png',),fit: BoxFit.fitWidth),
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
        SizedBox(height: 15),
        Text(
          "Credenz '21\n\n",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  // This widget will be passed as Bottom Card's Widget.
  Widget bottomCardWidget() {
    return RichText(
      text: TextSpan(
        text: "PICT IEEE Student Branch (PISB) was established in the year 1988 with an aim of inculcating a sense of technical awareness amongst its student members. PISB aims to escalate the knowledge and trends in the diverse fields of technologies amongst its members. PISB upholds two major events every year - Credenz and Credenz Tech Dayz with the first one being conducted in odd semester and the latter one in even semester. PISB is also marked by its Women in Engineering (WIE) chapter, an initiative for empowerment of women.",
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      textAlign: TextAlign.center,
    );
  }
}
