import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:credenz20/constants/API.dart';
import 'package:credenz20/constants/EventData.dart';
import 'package:credenz20/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

// import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'commons/slide_drawer.dart';
import 'constants/theme.dart';
import 'package:http/http.dart' as http;

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final storage = FlutterSecureStorage();
  int sum = 0;
  List list;
  bool load = true;

  // Razorpay _razorpay;
  final children1 = <Widget>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _razorpay = Razorpay();
    // _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    // _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    // _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    getEventPrices();
    sum = 0;
  }

  getEventPrices() async {
    prices1 = new Map();
    String url = allEventUrl;
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      List list = jsonDecode(response.body) as List;
      for (int i = 0; i < list.length; i++) {
        prices1[list[i]['event_name']] = list[i]['event_price'];
      }
      await loadCart();
    }
  }

  loadCart() async {
    sum = 0;
    children1.clear();
    list = List();
    for (int i = 0; i < 12; i++) {
      bool pre = await storage.containsKey(key: '$i');
      if (pre) {
        String eventName = await storage.read(key: '$i');
        list.add(eventName);
        prices1.containsKey(eventName)
            ? sum += prices1[eventName].toInt()
            : sum += 120;
      }
    }
    for (var i = 0; i < list.length; i++) {
      children1.add(new SizedBox(
        width: 50,
        child: AspectRatio(
          aspectRatio: 0.5,
          child: Container(
            padding: EdgeInsets.all(5),
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  //stops: [0.25, 2.5],
                  // colors: [Color(0xFF000000),Color(0xFF000000)]
                  //colors: [Color(0xFF3d3251), Color(0xFF272034)]
                  colors: [Color(0xff615de3),Color(0xff6c73ed)]
              ),
              //color: Colors.purple,
            ),
            child: Image.asset(
                eventimages[eventName.indexOf(list[i], 0)].assetName),
          ),
        ),
      ));
      children1.add(new SizedBox(
        width: 10,
      ));
    }
    setState(() {
      load = false;
    });
    print(list);
  }

  deleteFromCart(String title) async {
    int pos = eventName.indexOf(title);
    await storage.delete(key: '$pos');
    await loadCart();
    setState(() {
      load = false;
    });
    // await storage.delete(key: null);
  }

  /* void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId, timeInSecForIosWeb: 4);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message,
        timeInSecForIosWeb: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIosWeb: 4);
  }
*/
  pay() async {
    String username = await storage.read(key: 'username');
    String accToken = await storage.read(key: "accToken");
    if (username != null && accToken != null) {
      int amt = 0;
      for (int i = 0; i < list.length; i++) {
        String url =
            baseUrl + username + '/${list[i].toString().toLowerCase()}';

        ///rc
        print(accToken);
        Map<String, String> header = {"Authorization": "Bearer $accToken"};
        http.Response response = await http.post(url, headers: header);
        print(header);
        print(response.body);
        print(url);
        print(response.statusCode);
        if (response.statusCode == 200) {
          String msg = jsonDecode(response.body)['message'];
          if (msg == null) {
            amt = amt + jsonDecode(response.body)['price'];
          }
        }
      }
      if (amt != 0) {
        var options = {
          'key': 'rzp_test_8OXCvHsV5OiOpe',
          'amount': amt,
          'name': 'Acme Corp.',
          'description': 'Fine T-Shirt',
          'prefill': {
            'contact': '7397865565',
            'email': 'sarafatharva123@gmail.com'
          }
        };
        // _razorpay.open(options);
      } else {
        Fluttertoast.showToast(msg: "Events already registered");
      }
    } else {
      Fluttertoast.showToast(msg: "Please login before you register");
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => Login()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return load == true
        ? Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: Builder(
                builder: (context) {
                  return IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  );
                },
              ),
              title: Column(
                children: [
                  Text(' Your Cart'),

                ],
              ),
              backgroundColor: primary,
            ),
            body: Container(
                color: notiBackColor,
                child: Center(
                  child: Container(
                    child: loader1,
                  ),
                )),
          )
        : Container(
            height: MediaQuery.of(context).size.height,
            decoration: list.length == 0
                ? BoxDecoration(
                    color: notiBackColor,
                    image: DecorationImage(
                      image: AssetImage("images/emptycart.png"),
                      fit: BoxFit.scaleDown,
                    )
                    // gradient: LinearGradient(colors: [Color.fromRGBO(0, 0, 0, 0), Color.fromRGBO(0, 0, 0, 0)], stops: [0, 1])
                    )
                : BoxDecoration(color: notiBackColor, image: DecorationImage(
              image: AssetImage("images/contactb.jpg"),
              fit: BoxFit.fill,
            )),
            child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  centerTitle: true,
                  leading: Builder(
                    builder: (context) {
                      return IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                      );
                    },
                  ),
                  title: Column(
                    children: [
                      Text(' Your Cart'),
                      Text(
                        ' ${list.length} items ',
                        style: TextStyle(fontSize: 12, color: Colors.white70),
                      )
                    ],
                  ),
                  backgroundColor: primary,
                ),
                body: Container(
                  child: ListView(
                    children: [
                      ListView.builder(
                        itemBuilder: (BuildContext context, int pos) {
                          AssetImage ig =
                              eventimages[eventName.indexOf(list[pos], 0)];
                          return Card(
                            color: Color(0x22655dbd),
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            margin: EdgeInsets.fromLTRB(10, 7, 10, 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 88,
                                      child: AspectRatio(
                                        aspectRatio: 0.88,
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: primary,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Image.asset(ig.assetName),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          list[pos],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                          maxLines: 2,
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          prices1.containsKey(list[pos])
                                              ? "\u20B9 " +
                                                  prices1[list[pos]].toString()
                                              : "\u20B9 " + "120",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                IconButton(
                                  color: Colors.white,
                                  icon: Icon(Icons.delete),
                                  onPressed: () async {
                                    setState(() {
                                      load = true;
                                    });
                                    await deleteFromCart(list[pos]);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: list.length,
                        shrinkWrap: true,
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: list.length == 0
                    ? Container()
                    : Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 30,
                        ),
                        // height: 174,
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, -15),
                              blurRadius: 20,
                              color: Colors.black.withOpacity(1),
                            )
                          ],
                        ),
                        child: SafeArea(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 50,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: children1,
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      text: "Total:\n",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white),
                                      children: [
                                        TextSpan(
                                          text: "\u20B9 " + sum.toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 170,
                                    child: RaisedButton(
                                      onPressed: () async {
                                        await pay();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Text(
                                          'Register',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      color: Colors.purple,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10.0),
                                              bottomRight:
                                                  Radius.circular(10.0))),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
          );
  }
}
