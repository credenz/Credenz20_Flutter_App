import 'package:credenz20/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:credenz20/extra_lib/modified_slimy_card.dart';


class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AboutUs(),
    );
  }
}

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
        Container(  // Image goes here
          height: 200,
          // width: 500,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(image: AssetImage('images/credenz16.jpeg',),fit: BoxFit.fill),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
        SizedBox(height: 25),
        Text(
          "Credenz '21",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 5),
      ],
    );
  }

  // This widget will be passed as Bottom Card's Widget.
  Widget bottomCardWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        text: TextSpan(
          text:  "Credenz is the annual technical festival organised by the PICT IEEE Student Branch. Started in 2004, with a view to elicit the best out of each and every one, it has grown to become one of the finest technical events in Pune. Credenz aims not only to infuse a competitive spirit among participants, but also widen their horizons in the ever-changing field of technology via myriad seminars and workshops. Participants get a chance to discover their talents and thrive in numerous events like Clash, B Plan, RoboLIGA, WebWeaver, Pixelate, Cretronix, Paper Presentation and DataWiz. This is a unique chance for the students to go beyond the traditional spheres of academics and make the most of their potential. This spirit of learning and discovery has inspired the PICT IEEE Student Branch to present Credenz 19, a podium for you to nurture and cultivate your talents.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
