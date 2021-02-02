import 'dart:convert';

import 'package:credenz20/External_Package/CardSilverAppBar.dart';
import 'package:credenz20/External_Package/RaisedGradientButton.dart';
import 'package:credenz20/External_Package/floating_action_bubble.dart';
import 'package:credenz20/constants/API.dart';
import 'package:credenz20/constants/EventData.dart';
import 'package:credenz20/constants/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:im_stepper/stepper.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';
import 'package:http/http.dart' as http;
import '../loginPage.dart';

class EventDes extends StatefulWidget {
  int eventIndex;

  EventDes({Key key, @required this.eventIndex}) : super(key: key);

  @override
  _EventDesState createState() => _EventDesState();
}

class _EventDesState extends State<EventDes>
    with SingleTickerProviderStateMixin {


  bool favorite = false, isavail = false;
  GlobalKey<FormState> _key;
  String ieeeMenber;
  final storage = FlutterSecureStorage();
  String selectedValue, selectedValue1;
  String name;
  String email;
  Animation<double> _animation;
  AnimationController _animationController;
  List eventGroupIndex=[4,9,10];
  List<String> options = ["FE", "SE", "TE", "BE"];
  String val1;
  List<String> options1 = ["IEEE Member", "Non IEEE Member"];
  TextEditingController part1Controller=TextEditingController();
  TextEditingController part2Controller=TextEditingController();
  TextEditingController part3Controller=TextEditingController();
  TextEditingController teamController=TextEditingController();
  String accToken;

  addToCart(BuildContext context,{bool grp=false}) async {
    bool pre = await storage.containsKey(key: '${widget.eventIndex}');
    if (pre) {
      Fluttertoast.showToast(
          backgroundColor: Colors.blue.shade600,
          msg: 'Event is already added in Cart');
      if(grp)Navigator.pop(context);
    } else {
      if(grp==false) {
        await storage.write(
            key: '${widget.eventIndex}', value: eventName[widget.eventIndex]);
        Fluttertoast.showToast(
          msg: 'Event added', backgroundColor: Colors.blue.shade600,);
      }else{
        await storage.write(
            key: '${widget.eventIndex}grp', value: teamController.text.trim());
        await storage.write(
            key: '${widget.eventIndex}', value: eventName[widget.eventIndex]);
        if(part2Controller.text.trim().isNotEmpty){
          await storage.write(
              key: '${widget.eventIndex}part2', value: part2Controller.text.trim());
        }
        if(part3Controller.text.trim().isNotEmpty){
          await storage.write(
              key: '${widget.eventIndex}part3', value: part3Controller.text.trim());
        }
        Navigator.pop(context);
        Fluttertoast.showToast(
          msg: 'Event added', backgroundColor: Colors.blue.shade600,);
      }
    }
  }

  checkInCart() async {
     accToken=await storage.read(key: 'accToken');
    name=await storage.read(key: 'username');
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
                Image.asset(
                  // "images/contactb.jpg",
                  "gifs/giphy1.gif",
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                CardSliverAppBar(
                  // index: widget.eventIndex,
                  height: 250,
                  //gifs/space2.gif
                  // background:
                  //     Image.asset("images/enigma4.png", fit: BoxFit.fitHeight),
                  title: Text(eventName[index],
                      style: TextStyle(
                        fontFamily: 'Segoe UI Bold',
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  card: eventimages[index],
                  backButton: true,
                  backButtonColors: [Colors.white, Colors.white],
                  // action: IconButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       // favorite = !favorite;
                  //       addToCart();
                  //       checkInCart();
                  //     });
                  //   },
                  //   icon: favorite
                  //       ? Icon(Icons.shopping_cart)
                  //       : Icon(Icons.add_shopping_cart),
                  //   color: Colors.black,
                  //   iconSize: 30.0,
                  // ),
                  //
                  // onTap: (int tap_index) => _get_tap(tap_index),

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
                                color: Color(0x33000000),
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
            floatingActionButton: eventGroupIndex.contains(widget.eventIndex)==true?FloatingActionBubble(
              animation: _animation,
              onPress: () => _animationController.isCompleted
                  ? _animationController.reverse()
                  : _animationController.forward(),
              iconColor: Colors.grey.shade800,
              iconData: Icons.shopping_cart_outlined,
              backGroundColor: Colors.white,
              items: <Bubble>[
                // Floating action menu item
                // Bubble(
                //   title: "Solo   ",
                //   iconColor: Colors.white,
                //   bubbleColorGradient: commonGradient,
                //   icon: Icons.person,
                //   titleStyle: TextStyle(fontSize: 16, color: Colors.white),
                //   onPress: () async {
                //     if(accToken==null || accToken.isEmpty){
                //       Navigator.pop(context);
                //       Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Login()));
                //     }
                //     else {
                //       _animationController.reverse();
                //
                //       await addToCart();
                //     }
                //     // setState(() {
                //     //   favorite = !favorite;
                //     //   addToCart();
                //     // });
                //   },
                // ),
                // Floating action menu item
                Bubble(
                  title: "Group",
                  iconColor: Colors.white,
                  bubbleColorGradient: commonGradient,
                  icon: Icons.people,
                  titleStyle: TextStyle(fontSize: 16, color: Colors.white),
                  onPress: () async {
                    print(accToken);
                    if(accToken==null || accToken.isEmpty){
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Login()));
                    }else{
                    _animationController.reverse();
                    await dialogue(context);}
                    // setState(() {
                    //   favorite = !favorite;
                    //   // addToCart();
                    // });
                  },
                ),
              ],
            ):FloatingActionBubble(
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
                    if(accToken==null || accToken.isEmpty){
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Login()));
                    }else{
                    _animationController.reverse();

                    await addToCart(context);}
                    // setState(() {
                    //   favorite = !favorite;
                    //   // addToCart();
                    // });
                  },
                )
              ],
            ),

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



  Future<void> dialogue(BuildContext context) async {
    final _formKey = GlobalKey<FormState>();
    part1Controller.text=name;
    String val1;
    bool a=false;
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8),
                                      child: TextFormField(
                                        controller: teamController,
                                        validator: (String value) {
                                          if (value.isEmpty) return 'Team Name cannot be empty';

                                          return null;
                                        },
                                        style: TextStyle(color: Colors.black),
                                        keyboardType: TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide:
                                            BorderSide(color: Colors.black),
                                          ),
                                          isDense: true,
                                          labelText: 'Team Name',
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
                                        // enabled: false,
                                        // validator: (String value) {
                                        //   if (value.isEmpty) return 'Email cannot be empty';
                                        //
                                        //   return null;
                                        // },
                                        readOnly: true,
                                        onTap: () {
                                          Fluttertoast.showToast(backgroundColor: Colors.blue.shade600,
                                              msg: "First username is non-editable.");
                                          },
                                        controller: part1Controller,
                                        style: TextStyle(color: Colors.black),
                                        keyboardType: TextInputType.name,
                                        decoration: InputDecoration(
                                          // enabled: false,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          isDense: true,
                                          labelText: 'Username 1',
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
                                          labelText: 'Username 2',
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
                                          labelText: 'Username 3',
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
                                    child: a==true?loader:Text("Submit"),
                                    onPressed: () async{
                                      if(_formKey.currentState.validate())
                                        {
                                          setState(() {
                                            a=true;
                                          });
                                          await checkValidandAddToCart(context);
                                          setState(() {
                                            a=false;
                                          });
                                        }
                                    },
                                  ),
                                ],
                            )

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }


  checkValidandAddToCart(BuildContext context)async{

    String url=allUserUrl;
    if(part2Controller.text!=null || part3Controller.text!=null){
      http.Response response=await http.get(url);
      if(response.statusCode==200){
        List list=jsonDecode(response.body) as List;
        if(part2Controller.text!=null){
          String user2=part2Controller.text.trim();
          bool flag=false;
          for(int i=0;i<list.length;i++){
            if(list[i]['username']==user2){
              flag=true;
              break;
            }
          }
          if(flag==false){
            Fluttertoast.showToast(msg: 'Enter valid username for Username 2',backgroundColor: Colors.blue.shade600);
            return;
          }
        }
        if(part3Controller.text!=null){
          String user2=part3Controller.text.trim();
          bool flag=false;
          for(int i=0;i<list.length;i++){
            if(list[i]['username']==user2){
              flag=true;
              break;
            }
          }
          if(flag==false){
            Fluttertoast.showToast(msg: 'Enter valid username for Username 3',backgroundColor: Colors.blue.shade600);
            return;
          }
        }
        await addToCart(context,grp: true);
      }

    }else{
      await addToCart(context,grp: true);
    }

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
