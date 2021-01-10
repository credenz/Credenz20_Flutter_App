import 'package:credenz20/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:credenz20/extra_lib/modified_slimy_card.dart';
import 'package:url_launcher/url_launcher.dart';


class Ping extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("P.I.N.G."),

       // centerTitle: true,
        backgroundColor: drawerBackgroundColor,
      ),
      body: AboutPing(),
    );
  }
}

class AboutPing extends StatefulWidget {
  @override
  _AboutPingState createState() => _AboutPingState();
}

class _AboutPingState extends State<AboutPing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: drawerBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      child: Text("Know more here",

                          textAlign: TextAlign.end,
                          style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue,fontSize: 15.0)),
                      onTap: () {

                        launch('http://www.pictieee.in/ping.html');

                      }
                  ),
                ),
                // SlimyCard is being called here.

                /*SlimyCard(
                  // In topCardWidget below, imagePath changes according to the
                  // status of the SlimyCard(snapshot.data).
                  width: 450,
                  color: drawerBackgroundColor,
                  topCardHeight: 300,
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
        Text(
          "PICT IEEE Newsletter Group\n",
          style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(  // Image goes here
            height: 200,
            // width: 500,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(image: AssetImage('images/ping.jpg',),fit: BoxFit.fitHeight),
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
        SizedBox(height: 25),

      ],
    );
  }

  // This widget will be passed as Bottom Card's Widget.
  Widget bottomCardWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        text: TextSpan(
          text: "P.I.N.G. (PICT IEEE Newsletter Group) is the official technical magazine of PISB published twice a year. P.I.N.G. serves as a platform for individuals to portray their technical ingenuity. It highlights articles oncutting-edge technologies from technocrats all around the globe including students, industrialists and faculty members. It also features interviews of distinguished personalities in various technical domains. P.I.N.G. aims at keeping its readers up to date on recent developments in technology and helps them extrapolate their perceptions to contemporary ideas of modernisation. With the imminent Issue 16.1, be ready to get P.I.N.G.'d!",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
