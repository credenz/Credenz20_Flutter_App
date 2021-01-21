import 'package:credenz20/External_Package/CardSilverAppBar.dart';
import 'package:credenz20/External_Package/floating_action_bubble.dart';
import 'package:credenz20/constants/EventData.dart';
import 'package:credenz20/constants/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  final storage = FlutterSecureStorage();
  String selectedValue, selectedValue1;

  Animation<double> _animation;
  AnimationController _animationController;

  List<String> options = ["FE", "SE", "TE", "BE"];
  List<String> options1 = ["IEEE Member", "Non IEEE Member"];

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

  int activeStep=0;

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
                    // Image.asset(
                    //   // "images/contactb.jpg",
                    //   "gifs/desback.gif",
                    //   height: MediaQuery.of(context).size.height,
                    //   width: MediaQuery.of(context).size.width,
                    //   fit: BoxFit.cover,
                    // ),
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
                          color: Colors.white,
                          fontSize: 24,
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
                                color: Color(0x11000000),
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
            floatingActionButton: FloatingActionBubble(
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
            )

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
                child: Text(
                  intro[widget.eventIndex],
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  rules[widget.eventIndex],
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  structure[widget.eventIndex],
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  judging[widget.eventIndex],
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  contact[widget.eventIndex],
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
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
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.white,
              scrollable: true,
              content: Container(
                // color: primary,
                // height: 520,
                // width: 300,
                child: BlocProvider(
                  create: (context) => SerializedFormBloc(),
                  child: Builder(
                    builder: (context) {
                      final formBloc = context.bloc<SerializedFormBloc>();

                      return Theme(
                        data: Theme.of(context).copyWith(
                          inputDecorationTheme: InputDecorationTheme(
                            fillColor: textColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        child: FormBlocListener<SerializedFormBloc, String, String>(
                          onSuccess: (context, state) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(state.successResponse),
                              duration: Duration(seconds: 2),
                            ));
                          },
                          child: SingleChildScrollView(
                            physics: ClampingScrollPhysics(),
                            child: Column(
                              children: [
                                NumberStepper(
                                    numbers:[
                                      1,
                                      2,
                                      3,
                                    ],
                                  stepRadius: 12,
                                  activeStep: activeStep,
                                  onStepReached: (x){
                                    setState(() {
                                      activeStep=x;
                                    });
                                  },
                                ),
                                activeStep==0?Column(
                                  children: [
                                    TextFieldBlocBuilder(
                                      isEnabled: false,
                                      textFieldBloc: formBloc.p1,
                                      keyboardType: TextInputType.name,
                                      style: TextStyle(color: Color(0xFFD4D7DF)),
                                      decoration: InputDecoration(
                                        labelStyle: TextStyle(color: Color(0xFFD4D7DF)),
                                        contentPadding: EdgeInsets.all(0),
                                        labelText: 'Participant 1',
                                        prefixIcon: Icon(Icons.person),
                                      ),
                                    ),
                                    TextFieldBlocBuilder(
                                      style: TextStyle(color: Color(0xFFD4D7DF)),
                                      textFieldBloc: formBloc.p2,
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(

                                        labelStyle: TextStyle(color: Color(0xFFD4D7DF)),
                                        contentPadding: EdgeInsets.all(0),
                                        labelText: 'Participant 2',
                                        prefixIcon: Icon(Icons.person),
                                      ),
                                    ),
                                    TextFieldBlocBuilder(
                                      style: TextStyle(color: Color(0xFF242424)),
                                      textFieldBloc: formBloc.p3,
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        labelStyle: TextStyle(color: Color(0xFF242424)),
                                        contentPadding: EdgeInsets.all(0),
                                        labelText: 'Participant 3',
                                        prefixIcon: Icon(Icons.person),
                                      ),
                                    ),
                                    TextFieldBlocBuilder(
                                      style: TextStyle(color: Color(0xFF242424)),
                                      textFieldBloc: formBloc.p4,
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        labelStyle: TextStyle(color: Color(0xFF242424)),
                                        contentPadding: EdgeInsets.all(0),
                                        labelText: 'Participant 4',
                                        prefixIcon: Icon(Icons.person),
                                      ),
                                    ),
                                  ],
                                ):activeStep==1?Column(children: [
                                  TextFieldBlocBuilder(
                                    isEnabled: false,
                                    textFieldBloc: formBloc.e1,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(0),
                                      labelText: 'Email 1',
                                      prefixIcon: Icon(Icons.email),
                                    ),
                                  ),
                                  TextFieldBlocBuilder(
                                    textFieldBloc: formBloc.e2,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(0),
                                      labelText: 'Email 2',
                                      prefixIcon: Icon(Icons.email),
                                    ),
                                  ),
                                ],):Column(
                                  children: [
                                    Container(
                                      width: 300,
                                      height: 200,
                                      child: RadioButtonGroupFieldBlocBuilder<String>(
                                        selectFieldBloc: formBloc.year,
                                        itemBuilder: (context, value) =>
                                        value[0].toUpperCase() + value.substring(1),
                                        decoration: InputDecoration(
                                          labelText: 'Select Category',
                                          prefixIcon: SizedBox(),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text("Membership",),
                                    ),
                                    Container(
                                      width: 300,
                                      height: 150,
                                      child: RadioButtonGroupFieldBlocBuilder<String>(
                                        selectFieldBloc: formBloc.ieee,
                                        itemBuilder: (context, value) =>
                                        value[0].toUpperCase() + value.substring(1),
                                        decoration: InputDecoration(
                                          labelText: 'Select Category',
                                          prefixIcon: SizedBox(),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            // child: Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Column(
                            //     children: <Widget>[
                            //       Padding(
                            //         padding: const EdgeInsets.all(10.0),
                            //         child: Text("Names",),
                            //       ),
                            //       TextFieldBlocBuilder(
                            //
                            //         isEnabled: false,
                            //         textFieldBloc: formBloc.p1,
                            //         keyboardType: TextInputType.name,
                            //         style: TextStyle(color: Color(0xFFD4D7DF)),
                            //         decoration: InputDecoration(
                            //           labelStyle: TextStyle(color: Color(0xFFD4D7DF)),
                            //           contentPadding: EdgeInsets.all(0),
                            //           labelText: 'Participant 1',
                            //           prefixIcon: Icon(Icons.person),
                            //         ),
                            //       ),
                            //       TextFieldBlocBuilder(
                            //         style: TextStyle(color: Color(0xFFD4D7DF)),
                            //         textFieldBloc: formBloc.p2,
                            //         keyboardType: TextInputType.name,
                            //         decoration: InputDecoration(
                            //
                            //           labelStyle: TextStyle(color: Color(0xFFD4D7DF)),
                            //           contentPadding: EdgeInsets.all(0),
                            //           labelText: 'Participant 2',
                            //           prefixIcon: Icon(Icons.person),
                            //         ),
                            //       ),
                            //       TextFieldBlocBuilder(
                            //         style: TextStyle(color: Color(0xFF242424)),
                            //         textFieldBloc: formBloc.p3,
                            //         keyboardType: TextInputType.name,
                            //         decoration: InputDecoration(
                            //           labelStyle: TextStyle(color: Color(0xFF242424)),
                            //           contentPadding: EdgeInsets.all(0),
                            //           labelText: 'Participant 3',
                            //           prefixIcon: Icon(Icons.person),
                            //         ),
                            //       ),
                            //       TextFieldBlocBuilder(
                            //         style: TextStyle(color: Color(0xFF242424)),
                            //         textFieldBloc: formBloc.p4,
                            //         keyboardType: TextInputType.name,
                            //         decoration: InputDecoration(
                            //           labelStyle: TextStyle(color: Color(0xFF242424)),
                            //           contentPadding: EdgeInsets.all(0),
                            //           labelText: 'Participant 4',
                            //           prefixIcon: Icon(Icons.person),
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.all(10.0),
                            //         child: Text("Emails",),
                            //       ),
                            //       TextFieldBlocBuilder(
                            //         isEnabled: false,
                            //         textFieldBloc: formBloc.e1,
                            //         keyboardType: TextInputType.emailAddress,
                            //         decoration: InputDecoration(
                            //           contentPadding: EdgeInsets.all(0),
                            //           labelText: 'Email 1',
                            //           prefixIcon: Icon(Icons.email),
                            //         ),
                            //       ),
                            //       TextFieldBlocBuilder(
                            //         textFieldBloc: formBloc.e2,
                            //         keyboardType: TextInputType.emailAddress,
                            //         decoration: InputDecoration(
                            //           contentPadding: EdgeInsets.all(0),
                            //           labelText: 'Email 2',
                            //           prefixIcon: Icon(Icons.email),
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.all(10.0),
                            //         child: Text("Year of Study",),
                            //       ),
                            //       RadioButtonGroupFieldBlocBuilder<String>(
                            //         selectFieldBloc: formBloc.year,
                            //         itemBuilder: (context, value) =>
                            //         value[0].toUpperCase() + value.substring(1),
                            //         decoration: InputDecoration(
                            //           labelText: 'Select Category',
                            //           prefixIcon: SizedBox(),
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.all(10.0),
                            //         child: Text("Membership",),
                            //       ),
                            //       RadioButtonGroupFieldBlocBuilder<String>(
                            //         selectFieldBloc: formBloc.ieee,
                            //         itemBuilder: (context, value) =>
                            //         value[0].toUpperCase() + value.substring(1),
                            //         decoration: InputDecoration(
                            //           labelText: 'Select Category',
                            //           prefixIcon: SizedBox(),
                            //         ),
                            //       ),
                            //
                            //
                            //     ],
                            //   ),
                            // ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              actions: [
                RaisedButton(
                  child: Text("Cancel"),
                  onPressed: () {

                    Navigator.of(context).pop();
                  },
                ),
                RaisedButton(
                  child: Text("Submit"),
                  onPressed: () {

                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
        });
  }

  Widget tabcontroller() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: ShiftingTabBar(
        labelStyle: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
        // Specify a color to background or it will pick it from primaryColor of your app ThemeData
        color: Colors.transparent,
        // You can change brightness manually to change text color style to dark and light or it will decide based on your background color
        brightness: Brightness.dark,
        tabs: [
          // Also you should use ShiftingTab widget instead of Tab widget to get shifting animation
          ShiftingTab(icon: Icon(Icons.info_outline), text: "Intro"),
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
class SerializedFormBloc extends FormBloc<String, String> {
  final p1 = TextFieldBloc(
    initialValue: 'username',
    name: 'name1',
  );
  final p2 = TextFieldBloc(
    name: 'name2',
  );
  final p3 = TextFieldBloc(
    name: 'name3',
  );
  final p4 = TextFieldBloc(
    name: 'name4',
  );
  final e1 = TextFieldBloc(
    initialValue: 'email',
    name: 'email1',
  );
  final e2 = TextFieldBloc(
    name: 'email2',
  );

  final year = SelectFieldBloc(
    name: 'year',
    initialValue: 'FE',
    items: ['FE', 'SE', 'TE', 'BE'],
  );

  final ieee = SelectFieldBloc(
    name: 'ieee',
    initialValue: 'Non-IEEE Member',
    items: [
      'IEEE Member',
      'Non-IEEE Member',
    ],
  );

  SerializedFormBloc() {
    addFieldBlocs(
      fieldBlocs: [
        p1,
        p2,
        p3,
        p4,
        e1,
        e2,
        year,
        ieee,
      ],
    );
  }

  @override
  void onSubmitting() {
    // TODO: implement onSubmitting
  }
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
