import 'package:credenz20/constants/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'package:sliverbar_with_card/sliverbar_with_card.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';
import 'dart:math';

class EventDes extends StatefulWidget {
  @override
  _EventDesState createState() => _EventDesState();
}

Widget _mainbody() {
  return Stack(
    children: <Widget>[
      TabBarView(
        children: [
          Icon(Icons.home),
          Icon(Icons.directions_bike),
          Icon(Icons.directions_car),
          Icon(Icons.directions_transit),
          Icon(Icons.perm_contact_calendar),
        ],
      ),
    ],
  );
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
        ShiftingTab(
          icon: Icon(Icons.home),
          text: "Intro",
        ),
        ShiftingTab(icon: Icon(Icons.directions_bike), text: "Rules"),
        ShiftingTab(icon: Icon(Icons.directions_car), text: "Structure"),
        ShiftingTab(icon: Icon(Icons.directions_transit), text: "Judging"),
        ShiftingTab(icon: Icon(Icons.perm_contact_calendar), text: "Contact"),
      ],
    ),
    body: Container(
        // color: Color(0xaa272034),
        child: _mainbody()),
  );
}

class _EventDesState extends State<EventDes> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Stack(
          children: <Widget>[
            Stack(
              children: [
                Image.asset(
                  // "images/enigma.png",
                  "gifs/spacered.gif",
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                Center(
                  child: Image.asset(
                    "images/icon.png",
                    // "gifs/space3.gif",
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 2,
                    // fit: BoxFit.fitWidth,
                  ),
                ),
                // Container(
                //   color: Color(0xaa4E164B),
                // ),
              ],
            ),
            CardSliverAppBar(
              height: 250,
              //gifs/space2.gif
              // background:
              //     Image.asset("images/enigma4.png", fit: BoxFit.fitHeight),
              title: Text("Enigma",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              card: AssetImage('images/enigma4.png'),
              backButton: true,
              backButtonColors: [Colors.white, Colors.black],
              action: IconButton(
                onPressed: () {
                  setState(() {
                    favorite = !favorite;
                  });
                },
                icon: favorite
                    ? Icon(Icons.shopping_cart)
                    : Icon(Icons.add_shopping_cart),
                color: Colors.red,
                iconSize: 30.0,
              ),
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
                            color: Color(0xdd272034), child: tabcontroller()),
                      ),
                    ),
                  ),
                ),
              ),
            ),
//                padding: const EdgeInsets.only(top: 30),
            Container(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {},
                    textColor: Colors.white,
                    color: drawerBackgroundColor,
                    child: const Text('Register Now',
                        style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),

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
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class CardSliverAppBar extends StatefulWidget {
  final double height;
  final Image background;
  final double appBarHeight = 60;
  final Text title;
  final Text titleDescription;
  final bool backButton;
  final List<Color> backButtonColors;
  final Widget action;
  final Widget body;
  final ImageProvider card;

  CardSliverAppBar(
      {@required this.height,
      // @required this.background,
      @required this.title,
      @required this.body,
      this.background,
      this.titleDescription,
      this.backButton = false,
      this.backButtonColors,
      this.action,
      this.card,
      Key key})
      : assert(height != null && height > 0),
        // assert(background != null),
        assert(title != null),
        assert(body != null),
        super(key: key);

  @override
  _CardSliverAppBarState createState() => _CardSliverAppBarState();
}

class _CardSliverAppBarState extends State<CardSliverAppBar>
    with SingleTickerProviderStateMixin, TickerProviderStateMixin {
  ScrollController _scrollController;
  AnimationController _animationController;
  Animation<double> _fadeTransition;
  Animatable<Color> _animatedBackButtonColors;
  Animation<double> _rotateCard;

  AnimationController animation;
  Animation<double> _fadeInFadeOut;

  double _scale = 0.0;
  double _offset = 0.0;

  @override
  void dispose() {
    _scrollController?.dispose();
    _animationController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    _fadeTransition = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.4, 1.0, curve: Curves.easeIn)))
      ..addListener(() {
        setState(() {});
      });
    if (widget.card != null) {
      _rotateCard = Tween(begin: 0.0, end: 0.4).animate(
          CurvedAnimation(curve: Curves.linear, parent: _animationController))
        ..addListener(() {
          setState(() {});
        });
    }
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {});
      });

    animation = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 0.5).animate(animation);
  }

  void _animationValue(double scale) {
    _animationController.value = scale;
  }

  //gets
  get _backButtonColors => widget.backButtonColors;

  get _card => widget.card;

  get _action => widget.action;

  get _backButton => widget.backButton;

  get _height => widget.height;

  get _body => widget.body;

  get _appBarHeight => widget.appBarHeight;

  get _background => widget.background;

  get _titleDescription => widget.titleDescription;

  get _title => widget.title;

  @override
  Widget build(BuildContext context) {
    if (_scrollController.hasClients) {
      _scale = _scrollController.offset / (widget.height - widget.appBarHeight);
      if (_scale > 1) {
        _scale = 1.0;
      }
      _offset = _scrollController.offset;
    }
    _animationValue(_scale);
    _scale = 1.0 - _scale;

    if (_backButtonColors != null && _backButtonColors.length >= 2) {
      _animatedBackButtonColors = TweenSequence<Color>([
        TweenSequenceItem(
            weight: 1.0,
            tween: ColorTween(
              begin: _backButtonColors[0],
              end: _backButtonColors[1],
            ))
      ]);
    }

    List<Widget> stackOrder = List<Widget>();
    if (_scale >= 0.5) {
      animation.forward();
      stackOrder.add(_bodyContainer());
      // stackOrder.add(_backgroundConstructor());
      stackOrder.add(_shadowConstructor());
      stackOrder.add(_titleConstructor());
      if (_card != null) stackOrder.add(_cardConstructor());
      // if (_action != null) stackOrder.add(_actionConstructor());
      if (_backButton != null && _backButton)
        stackOrder.add(_backButtonConstructor());
      stackOrder.add(_centercardConstructor());
    } else {
      animation.reverse();
      // stackOrder.add(_backgroundConstructor());
      if (_card != null) stackOrder.add(_cardConstructor());
      stackOrder.add(_bodyContainer());
      stackOrder.add(_shadowConstructor());
      stackOrder.add(_titleConstructor());
      // if (_action != null) stackOrder.add(_actionConstructor());
      if (_backButton != null && _backButton)
        stackOrder.add(_backButtonConstructor());
    }

    if (_scale == 1.0) {
      // animation.addStatusListener((status){
      //   if(status == AnimationStatus.completed){
      //   }
      //   // else {
      //   //   animation.forward();
      //   // }
      // });
      // animation.forward();

    }

    return SafeArea(
      child: Container(
        child: ListView(
          controller: _scrollController,
          primary: false,
          children: <Widget>[
            Stack(
              key: Key("widget_stack"),
              children: stackOrder,
            )
          ],
        ),
      ),
    );
  }

  Widget _backButtonConstructor() {
    return Positioned(
      top: _offset + 7,
      left: 5,
      child: Column(
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back),
            color: _animatedBackButtonColors != null
                ? _animatedBackButtonColors.evaluate(
                    AlwaysStoppedAnimation(_animationController.value))
                : Colors.white,
            iconSize: 25,
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  Widget _bodyContainer() {
    return Container(
      key: Key("widget_body"),
      margin: EdgeInsets.only(top: _height),
      child: _body,
    );
  }

  double _getRotationAnimationValue(double animValue) {
    animValue = animValue * 5;
    final double value = -pow(animValue, 2) + (2 * animValue);
    return value;
  }

  double _getCardTopMargin() {
    final double value = _scale <= 0.5
        ? widget.height - ((widget.appBarHeight * 3.6) * _scale)
        : widget.height - (widget.appBarHeight * 1.8);
    return value;
  }

  Widget _cardConstructor() {
    return Positioned(
      key: Key("widget_card"),
      top: _getCardTopMargin(),
      // top: _getCardTopMargin()-_appBarHeight*0.67,
      left: 20,
      child: FadeTransition(
        opacity: _fadeInFadeOut,

        // angle: _getRotationAnimationValue(_rotateCard.value),
        // origin: Offset(50, -70),
        child: SizedBox(
          width: _appBarHeight * 1.67,
          height: _appBarHeight * 2.3,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(image: _card, fit: BoxFit.cover)),
          ),
        ),
      ),
    );
  }

  Widget _centercardConstructor() {
    return Center(
      child: FadeTransition(
        opacity: _fadeInFadeOut,
        // angle: _getRotationAnimationValue(_rotateCard.value),
        // origin: Offset(50, -70),
        child: SizedBox(
          width: _appBarHeight * 1.67,
          height: _appBarHeight * 2.3,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(image: AssetImage("images/enigma.png"), fit: BoxFit.cover)),
          ),
        ),
      ),
    );
  }

  Widget _backgroundConstructor() {
    return Container(
      key: Key("widget_background"),
      height: _height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: FadeTransition(
        opacity: _fadeTransition,
        child: _background,
      ),
    );
  }

  Widget _shadowConstructor() {
    return Positioned(
        key: Key("widget_appbar_shadow"),
        top: _scale == 0.0 ? _offset + _appBarHeight : _height,
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            decoration:
                const BoxDecoration(color: Colors.transparent, boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 1.0,
              )
            ])));
  }

  Widget _titleConstructor() {
    return Positioned(
      key: Key("widget_title"),
      top: _scale == 0.0 ? _offset : widget.height - widget.appBarHeight,
      child: ClipPath(
        clipper: _MyCliperChanfro(_animationController.value),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
              left: _scale >= 0.12
                  ? 40 + ((MediaQuery.of(context).size.width / 4) * _scale)
                  : 50),
          width: MediaQuery.of(context).size.width,
          color: Colors.transparent,
          height: _appBarHeight,
          child: _titleDescriptionHandler(),
        ),
      ),
    );
  }

  Widget _titleDescriptionHandler() {
    if (_titleDescription != null) {
      var titleContainer = Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(bottom: (25 * _scale)),
        child: _title,
      );

      var titleDescriptionContainer = Opacity(
        opacity: _scale <= 0.7 ? _scale / 0.7 : 1.0,
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: (25 * _scale)),
          child: _titleDescription,
        ),
      );

      return Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          titleDescriptionContainer,
          titleContainer,
        ],
      );
    } else {
      return _title;
    }
  }

  Widget _actionConstructor() {
    return Positioned(
        key: Key("widget_action"),
        top: _height - _appBarHeight - 25,
        right: 10,
        child: Transform.scale(
            scale: _scale >= 0.5 ? 1.0 : (_scale / 0.5),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  boxShadow: const [
                    BoxShadow(color: Colors.black54, blurRadius: 3.0)
                  ]),
              child: _action,
            )));
  }
}

class _MyCliperChanfro extends CustomClipper<Path> {
  double scale;

  _MyCliperChanfro(this.scale);

  @override
  Path getClip(Size size) {
    Path path = Path();
    scale = 1.0 - scale;
    if (scale >= 0.5) {
      path.lineTo(0, 30);
      path.lineTo(50, 0);
    } else {
      path.lineTo(0, (scale / 0.5) * 30);
      path.lineTo((scale / 0.5) * 50, 0);
    }
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

/*
    return Scaffold(
      body: SingleChildScrollView(
        // scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(

              child: CardSliverAppBar(
                height: 300,
                background: Image.asset("images/contraption.png",
                    fit: BoxFit.fitHeight),
                title: Text("Clash",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                card: AssetImage('images/icon.jpg'),
                backButton: true,
                backButtonColors: [Colors.white, Colors.black],
                action: IconButton(
                  onPressed: () {
                    setState(() {
                      favorite = !favorite;
                    });
                  },
                  icon: favorite
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_border),
                  color: Colors.red,
                  iconSize: 30.0,
                ),
                body: Container(
                  alignment: Alignment.topLeft,
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
              ),
            ),
            Container(
              child: DefaultTabController(
                length: 5,
                child: Scaffold(
                  // Use ShiftingTabBar instead of appBar
                  appBar: ShiftingTabBar(
                    // Specify a color to background or it will pick it from primaryColor of your app ThemeData
                    color: Colors.grey,
                    // You can change brightness manually to change text color style to dark and light or
                    // it will decide based on your background color
                    // brightness: Brightness.dark,
                    tabs: [
                      // Also you should use ShiftingTab widget instead of Tab widget to get shifting animation
                      ShiftingTab(
                        icon: Icon(Icons.home),
                        text: "Test 1",
                      ),
                      ShiftingTab(
                          icon: Icon(Icons.directions_bike), text: "Test 2"),
                      ShiftingTab(
                          icon: Icon(Icons.directions_car), text: "Test 3"),
                      ShiftingTab(
                          icon: Icon(Icons.directions_transit), text: "Test 4"),
                      ShiftingTab(
                          icon: Icon(Icons.directions_boat), text: "Test 5"),
                    ],
                  ),
                  // Other parts of the app are exacly same as default TabBar widget
                  body: TabBarView(
                    children: [
                      Icon(Icons.home),
                      Icon(Icons.directions_bike),
                      Icon(Icons.directions_car),
                      Icon(Icons.directions_transit),
                      Icon(Icons.directions_boat),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
*/

// return Scaffold(
//   body: NestedScrollView(
//     scrollDirection: Axis.vertical,
//
//     headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled){
//       return <Widget>[
//         CardSliverAppBar(
//           height: 300,
//           background:
//           Image.asset("images/contraption.png", fit: BoxFit.fitHeight),
//           title: Text("Clash",
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold)),
//           card: AssetImage('images/icon.jpg'),
//           backButton: true,
//           backButtonColors: [Colors.white, Colors.black],
//           action: IconButton(
//             onPressed: () {
//               setState(() {
//                 favorite = !favorite;
//               });
//             },
//             icon: favorite
//                 ? Icon(Icons.favorite)
//                 : Icon(Icons.favorite_border),
//             color: Colors.red,
//             iconSize: 30.0,
//           ),
//           body: Container(
//             alignment: Alignment.topLeft,
//             color: Colors.white,
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//           ),
//         ),
//
//       ];
//     },
//
//     body: DefaultTabController(
//       length: 5,
//       child: Scaffold(
//         // Use ShiftingTabBar instead of appBar
//         appBar: ShiftingTabBar(
//           // Specify a color to background or it will pick it from primaryColor of your app ThemeData
//           color: Colors.grey,
//           // You can change brightness manually to change text color style to dark and light or
//           // it will decide based on your background color
//           // brightness: Brightness.dark,
//           tabs: [
//             // Also you should use ShiftingTab widget instead of Tab widget to get shifting animation
//             ShiftingTab(
//               icon: Icon(Icons.home),
//               text: "Test 1",
//             ),
//             ShiftingTab(
//                 icon: Icon(Icons.directions_bike), text: "Test 2"),
//             ShiftingTab(
//                 icon: Icon(Icons.directions_car), text: "Test 3"),
//             ShiftingTab(
//                 icon: Icon(Icons.directions_transit), text: "Test 4"),
//             ShiftingTab(
//                 icon: Icon(Icons.directions_boat), text: "Test 5"),
//           ],
//         ),
//         // Other parts of the app are exacly same as default TabBar widget
//         body: TabBarView(
//           children: [
//             Icon(Icons.home),
//             Icon(Icons.directions_bike),
//             Icon(Icons.directions_car),
//             Icon(Icons.directions_transit),
//             Icon(Icons.directions_boat),
//           ],
//         ),
//       ),
//     ),
//   ),
//   // home:
// );
