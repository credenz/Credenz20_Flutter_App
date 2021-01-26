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

class _AboutUsState extends State<AboutUs> with SingleTickerProviderStateMixin {



  AnimationController controller;
  Animation<double> animation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);


    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: backColor,
      body: Container(
        decoration: BoxDecoration(
            color: backColor,
            image: DecorationImage(
              image: AssetImage("images/contactb.jpg"),
              fit: BoxFit.fill,
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  FadeTransition(child: bottomCardWidget(),opacity: animation,),
                  SizedBox(height: 25,)
                  // SlimyCard is being called here.
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  // This widget will be passed as Top Card's Widget.
  Widget topCardWidget() {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 5),
        Text(
          "CREDENZ",
          style: TextStyle(
              fontFamily: 'Segoe UI',
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(  // Image goes here
            height: 200,
            // width: 500,
            decoration: BoxDecoration(
              //color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(image: AssetImage('images/aboutlogo.png',),fit: BoxFit.fill),
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

      ],
    );
  }

  // This widget will be passed as Bottom Card's Widget.
  Widget bottomCardWidget() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        "Credenz is the annual technical festival organised by the PICT IEEE Student Branch. Started in 2004, with a view to elicit the best out of each and every one, it has grown to become one of the finest technical events in Pune. Credenz aims not only to infuse a competitive spirit among participants, but also widen their horizons in the ever-changing field of technology via myriad seminars and workshops. Participants get a chance to discover their talents and thrive in numerous events like Clash, B Plan, RoboLIGA, WebWeaver, Pixelate, Cretronix, Paper Presentation and DataWiz. This is a unique chance for the students to go beyond the traditional spheres of academics and make the most of their potential. This spirit of learning and discovery has inspired the PICT IEEE Student Branch to present Credenz 19, a podium for you to nurture and cultivate your talents.",
        style: TextStyle(
          fontFamily: 'Segoe UI',
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.justify,

      )

    );
  }
}
