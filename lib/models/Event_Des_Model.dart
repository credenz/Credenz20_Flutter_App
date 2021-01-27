import 'package:credenz20/External_Package/CardSilverAppBar.dart';
import 'package:credenz20/External_Package/RaisedGradientButton.dart';
import 'package:credenz20/External_Package/floating_action_bubble.dart';
import 'package:credenz20/constants/EventData.dart';
import 'package:credenz20/constants/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:im_stepper/stepper.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';

class EventDes extends StatefulWidget {
  int eventIndex;

  EventDes({Key key, @required this.eventIndex}) : super(key: key);

  @override
  _EventDesState createState() => _EventDesState();
}

class _EventDesState extends State<EventDes>
    with SingleTickerProviderStateMixin {
  final gender = SelectFieldBloc(
    name: 'gender',
    items: ['male', 'female'],
  );
  bool favorite = false, isavail = false;
  GlobalKey<FormState> _key;
  String ieeeMenber;
  final storage = FlutterSecureStorage();
  String selectedValue, selectedValue1;

  Animation<double> _animation;
  AnimationController _animationController;
  List eventGroupIndex=[4,9,10];
  List<String> options = ["FE", "SE", "TE", "BE"];
  List<String> options1 = ["IEEE Member", "Non IEEE Member"];
  TextEditingController part1Controller=TextEditingController();
  TextEditingController email1Controller=TextEditingController();
  TextEditingController part2Controller=TextEditingController();
  TextEditingController email2Controller=TextEditingController();
  TextEditingController part3Controller=TextEditingController();
  TextEditingController part4Controller=TextEditingController();

  addToCart() async {
    bool pre = await storage.containsKey(key: '${widget.eventIndex}');
    if (pre) {
      Fluttertoast.showToast(msg: 'Event already added');
    } else {
      await storage.write(
          key: '${widget.eventIndex}', value: eventName[widget.eventIndex]);
      Fluttertoast.showToast(msg: 'Event added');
    }
  }

  checkInCart() async {
    bool pre = await storage.containsKey(key: '${widget.eventIndex}');
    if (pre) {
      setState(() {
        isavail = true;
        favorite = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedValue = options.first;
    selectedValue1 = options1.first;
    checkInCart();
    _animationController = AnimationController(
      // vsync: this,
      duration: Duration(milliseconds: 260), vsync: this,
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
  }

  int activeStep = 0;

  @override
  Widget build(BuildContext context) {
    int index = widget.eventIndex;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        child: Scaffold(
            body: Stack(
              children: <Widget>[
                Stack(
                  children: [
                    Image.asset(
                      // "images/contactb.jpg",
                      "gifs/giphy1.gif",
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                    // Container(
                    //   color: Color(0xaa4E164B),
                    // ),
                  ],
                ),
                CardSliverAppBar(
                  // index: widget.eventIndex,
                  height: 250,
                  //gifs/space2.gif
                  background:
                      Image.asset("images/enigma4.png", fit: BoxFit.fitHeight),
                  title: Text(eventName[index],
                      style: TextStyle(
                        fontFamily: 'Segoe UI Bold',
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  card: eventimages[index],
                  backButton: true,
                  backButtonColors: [Colors.white, Colors.white],
                  action: IconButton(
                    onPressed: () {
                      setState(() {
                        // favorite = !favorite;
                        addToCart();
                        checkInCart();
                      });
                    },
                    icon: favorite
                        ? Icon(Icons.shopping_cart)
                        : Icon(Icons.add_shopping_cart),
                    color: Colors.black,
                    iconSize: 30.0,
                  ),

                  onTap: (int tap_index) => _get_tap(tap_index),

                  body: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      // color: Color(0x66272034),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height -
                          1.8 * AppBar().preferredSize.height,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: DefaultTabController(
                          length: 5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45.0),
                              topRight: Radius.circular(45.0),
                            ),
                            child: Card(
                                color: Color(0x22000000),
                                child: Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: tabcontroller())),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //A1045A,
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     crossAxisAlignment: CrossAxisAlignment.stretch,
                //     children: <Widget>[
                //       RaisedButton(
                //         onPressed: ()async{
                //           addToCart();
                //         },
                //         textColor: Colors.white,
                //         color: drawerBackgroundColor,
                //         child: const Text('Add to Cart',
                //             style: TextStyle(fontSize: 20)),
                //       ),
                //     ],
                //   ),
                // ),

/*
              Container(
                color: drawerBackgroundColor,
                // color: drawerBackgroundColor,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      border: new Border.all(color: Colors.black),
                      image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage('images/enigma.png'),
                  )),
                ),
              ),
*/
              ],
            ),
            floatingActionButton: eventGroupIndex.contains(widget.eventIndex)?FloatingActionBubble(
              animation: _animation,
              onPress: () => _animationController.isCompleted
                  ? _animationController.reverse()
                  : _animationController.forward(),
              iconColor: Colors.grey.shade800,
              iconData: Icons.shopping_cart_outlined,
              backGroundColor: Colors.white,
              items: <Bubble>[
                // Floating action menu item
                Bubble(
                  title: "Solo   ",
                  iconColor: Colors.white,
                  bubbleColorGradient: commonGradient,
                  icon: Icons.person,
                  titleStyle: TextStyle(fontSize: 16, color: Colors.white),
                  onPress: () async {
                    _animationController.reverse();

                    //await dialogue(context);
                    setState(() {
                      favorite = !favorite;
                      addToCart();
                    });
                  },
                ),
                // Floating action menu item
                Bubble(
                  title: "Group",
                  iconColor: Colors.white,
                  bubbleColorGradient: commonGradient,
                  icon: Icons.people,
                  titleStyle: TextStyle(fontSize: 16, color: Colors.white),
                  onPress: () async {
                    _animationController.reverse();
                    await dialogue(context);
                    setState(() {
                      favorite = !favorite;
                      // addToCart();
                    });
                  },
                ),
              ],
            ):FloatingActionButton(
              child: Icon(Icons.shopping_cart_outlined,color: Colors.grey.shade800,),
              backgroundColor: Colors.white,
              onPressed: ()async{
                await dialogue1(context);
              },)

            /*FloatingActionButton(
            child: new Icon( favorite
                ? Icons.shopping_cart
                : Icons.add_shopping_cart,
              color: Colors.black,),
            onPressed: favorite?(){
              Fluttertoast.showToast(msg: 'Event already added');
            }:() async{
await dialogue(context);
                setState(() {
                  favorite = !favorite;
                  addToCart();
                });
            },
            backgroundColor: Colors.white,
            elevation: 20.0,
          ),*/
            ),
      ),
    );
  }

  _get_tap(int index) {
    addToCart();
  }

  Widget _mainbody() {
    return Stack(
      children: <Widget>[
        TabBarView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: //Text(
                  intro[widget.eventIndex],
                  /*style: TextStyle(fontSize: 18.0, color: Colors.white),
                  textAlign: TextAlign.justify,
                ),*/
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: //Text(
                  rules[widget.eventIndex],
                  //textAlign: TextAlign.justify,
                  //style: TextStyle(fontSize: 18.0, color: Colors.white),
                //),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: //Text(
                  structure[widget.eventIndex],
                  //style: TextStyle(fontSize: 18.0, color: Colors.white),
                //),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: //Text(
                  judging[widget.eventIndex],
                  //style: TextStyle(fontSize: 18.0, color: Colors.white),
                //),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: //Text(
                  contact[widget.eventIndex],
                 // style: TextStyle(fontSize: 18.0, color: Colors.white),
               // ),
              ),
            ),
            // Icon(Icons.home),
            // Icon(Icons.directions_bike),
            // Icon(Icons.directions_car),
            // Icon(Icons.directions_transit),
            // Icon(Icons.perm_contact_calendar),
          ],
        ),
      ],
    );
  }

  Future<void> dialogue1(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Center(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                  child: Container(
                    height: 200,
                    width: 280,
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade700,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0)
                    ),
                    child: Column(
                      children: [
                        DropdownButton(
                          items: [
                            DropdownMenuItem(
                              child: Text('IEEE member'),
                              value: 'IEEE',
                            ),
                            DropdownMenuItem(
                              child: Text('Non-IEEE member'),
                              value: 'Non',
                            ),
                          ],
                          isExpanded: true,
                          onChanged: (String val) {
                            setState(() {
                              ieeeMenber = val;
                            });
                          },
                          value: ieeeMenber,
                          hint: Text('Select Category'),
                        ),
                        RaisedGradientButton(
                          height: 40,
                          width: 80,
                          gradient: LinearGradient(colors: commonGradient),
                          child: Text("Submit"),
                          onPressed: () {
                          },
                        ),
                      ],
                    )
                  ),
                ),
              ),
            );
          });
        });
  }

  Future<void> dialogue(BuildContext context) async {
    String val1;
    String val2;
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Center(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                  child: Container(
                    height: 450,
                    width: 280,
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade700,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NumberStepper(
                          numbers: [
                            1,
                            2,
                          ],
                          stepRadius: 12,
                          activeStep: activeStep,
                          onStepReached: (x) {
                            setState(() {
                              activeStep = x;
                            });
                          },
                        ),
                        activeStep == 0
                            ? Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: TextFormField(
                                      // validator: (String value) {
                                      //   if (value.isEmpty) return 'Email cannot be empty';
                                      //
                                      //   return null;
                                      // },
                                      controller: part1Controller,
                                      style: TextStyle(color: Colors.black),
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        isDense: true,
                                        labelText: 'Participant 1',
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: TextFormField(
                                      controller: part2Controller,
                                      // validator: (String value) {
                                      //   if (value.isEmpty) return 'Email cannot be empty';
                                      //
                                      //   return null;
                                      // },
                                      style: TextStyle(color: Colors.black),
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        isDense: true,
                                        labelText: 'Participant 2',
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: TextFormField(
                                      controller: part3Controller,
                                      // validator: (String value) {
                                      //   if (value.isEmpty) return 'Email cannot be empty';
                                      //
                                      //   return null;
                                      // },
                                      style: TextStyle(color: Colors.black),
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        isDense: true,
                                        labelText: 'Participant 3',
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: TextFormField(
                                      controller: part4Controller,
                                      // validator: (String value) {
                                      //   if (value.isEmpty) return 'Email cannot be empty';
                                      //
                                      //   return null;
                                      // },
                                      style: TextStyle(color: Colors.black),
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        isDense: true,
                                        labelText: 'Participant 4',
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : activeStep == 1
                                ? Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(8),
                                        child: TextFormField(
                                          controller: email1Controller,
                                          // validator: (String value) {
                                          //   if (value.isEmpty) return 'Email cannot be empty';
                                          //
                                          //   return null;
                                          // },
                                          style: TextStyle(color: Colors.black),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: Colors.black),
                                            ),
                                            isDense: true,
                                            labelText: 'Email 1',
                                            labelStyle:
                                                TextStyle(color: Colors.black),
                                            disabledBorder: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: Colors.black),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8),
                                        child: TextFormField(
                                          controller: email2Controller,
                                          // validator: (String value) {
                                          //   if (value.isEmpty) return 'Email cannot be empty';
                                          //
                                          //   return null;
                                          // },
                                          style: TextStyle(color: Colors.black),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: Colors.black),
                                            ),
                                            isDense: true,
                                            labelText: 'Email 2',
                                            labelStyle:
                                                TextStyle(color: Colors.black),
                                            disabledBorder: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: Colors.black),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          padding: EdgeInsets.only(left: 10),
                                          child: DropdownButton(
                                            items: [
                                              DropdownMenuItem(
                                                child: Text('FE'),
                                                value: 'FE',
                                              ),
                                              DropdownMenuItem(
                                                child: Text('SE'),
                                                value: 'SE',
                                              ),
                                              DropdownMenuItem(
                                                child: Text('TE'),
                                                value: 'TE',
                                              ),
                                              DropdownMenuItem(
                                                child: Text('BE'),
                                                value: 'BE',
                                              ),
                                            ],
                                            isExpanded: true,
                                            onChanged: (String val) {
                                              setState(() {
                                                val1 = val;
                                              });
                                            },
                                            value: val1,
                                            hint: Text('Select Year'),
                                          ),
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 1.0,
                                                  style: BorderStyle.solid),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: DropdownButton(
                                            items: [
                                              DropdownMenuItem(
                                                child: Text('IEEE member'),
                                                value: 'IEEE',
                                              ),
                                              DropdownMenuItem(
                                                child: Text('Non-IEEE member'),
                                                value: 'Non',
                                              ),
                                            ],
                                            isExpanded: true,
                                            onChanged: (String val) {
                                              setState(() {
                                                val2 = val;
                                              });
                                            },
                                            value: val2,
                                            hint: Text('Select Category'),
                                          ),
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 1.0,
                                                  style: BorderStyle.solid),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  )
                                : Column(
                                    children: [

                                    ],
                                  ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                                RaisedGradientButton(
                                  height: 40,
                                  width: 80,
                                  gradient: LinearGradient(colors: commonGradient),
                                  child: activeStep == 0 ? Text("Cancel") : Text("Back"),
                                  onPressed: () {
                                    if (activeStep == 1) {
                                      setState(() {
                                        activeStep = 0;
                                      });
                                    } else
                                      Navigator.of(context).pop();
                                  },
                                ),
                                RaisedGradientButton(
                                  height: 40,
                                  width: 80,
                                  gradient: LinearGradient(colors: commonGradient),
                                  child: activeStep == 0 ? Text('Next') : Text("Submit"),
                                  onPressed: () {
                                    if (activeStep == 0) {
                                      setState(() {
                                        activeStep = 1;
                                      });
                                    } else
                                      Navigator.of(context).pop();
                                  },
                                ),
                              ],
                          )

                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }

  Widget tabcontroller() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: ShiftingTabBar(
        labelStyle: TextStyle(
          fontFamily: 'Segoe UI Bold',
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 12,
        ),
        // Specify a color to background or it will pick it from primaryColor of your app ThemeData
        color: Colors.transparent,
        // You can change brightness manually to change text color style to dark and light or it will decide based on your background color
        brightness: Brightness.dark,
        tabs: [
          // Also you should use ShiftingTab widget instead of Tab widget to get shifting animation
          ShiftingTab(icon: Icon(Icons.info_outline), text: "Intro",),
          ShiftingTab(icon: Icon(Icons.assignment), text: "Rules"),
          ShiftingTab(icon: Icon(Icons.device_hub), text: "Structure"),
          ShiftingTab(icon: Icon(Icons.assessment), text: "Judging"),
          ShiftingTab(icon: Icon(Icons.perm_contact_calendar), text: "Contact"),
        ],
      ),
      body: Container(
          // color: Color(0xaa272034),
          child: _mainbody()),
    );
  }
}
