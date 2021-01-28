import 'package:credenz20/External_Package/RaisedGradientButton.dart';
import 'package:credenz20/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Ping extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("P.I.N.G.", style: TextStyle(fontFamily: 'Segoe UI',),),

        centerTitle: true,
        backgroundColor: primary,
      ),
      body: AboutPing(),
    );
  }
}

class AboutPing extends StatefulWidget{
  @override
  _AboutPingState createState() => _AboutPingState();
}

class _AboutPingState extends State<AboutPing> with TickerProviderStateMixin{


  AnimationController controller;
  Animation<double> animation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);



    controller.forward();

  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: backColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: StreamBuilder(
          // This streamBuilder reads the real-time status of SlimyCard.
          initialData: true,
          //Stream of SlimyCard
          builder: ((BuildContext context, AsyncSnapshot snapshot) {
            return ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                 topCardWidget(),
                 FadeTransition(child: bottomCardWidget(),opacity: animation,),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Align(
                    alignment:Alignment.center,
                    // child: RaisedButton(
                    //   onPressed: () {
                    //     launch('http://pictieee.in/');
                    //   },
                    //   shape:RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.only(
                    //           topLeft: Radius.circular(10.0),
                    //           bottomRight: Radius.circular(10.0))),
                    //   child: Text("Read P.I.N.G Issue Here",
                    //       textAlign: TextAlign.end,
                    //       style: TextStyle(
                    //         // decoration: TextDecoration.underline,
                    //           color: Colors.blue,
                    //           fontSize: 15.0)),
                    //   color: Color(0xff222222),
                    //
                    // ),

                      child:RaisedGradientButton(
                          height: 40.0,
                          width: 180.0,
                          child:Text("Read P.I.N.G Issue Here",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                // decoration: TextDecoration.underline,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0)),
                          gradient: LinearGradient(
                            colors: <Color>[Color(0xff4e50bc), Color(0xff55c2fc)],
                          ),
                        onPressed: () {
                          launch('https://pictieee.in/ping.html');
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
              fontFamily: 'Segoe UI',
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
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(image: AssetImage('images/ping.png',),fit: BoxFit.fitHeight),
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
            fontFamily: 'Segoe UI',
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w100,
          ),
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
