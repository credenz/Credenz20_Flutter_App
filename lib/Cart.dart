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
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'commons/slide_drawer.dart';
import 'constants/theme.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final storage = FlutterSecureStorage();
  List list;
  bool load = true;
  Razorpay _razorpay;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    loadCart();
  }

  loadCart() async {
    list = List();
    for (int i = 0; i < 12; i++) {
      bool pre = await storage.containsKey(key: '$i');
      if (pre) {
        String eventName = await storage.read(key: '$i');
        list.add(eventName);
      }
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

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
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

  pay() async {
    String username = await storage.read(key: 'username');
    String accToken = await storage.read(key: "accToken");
    if (username != null && accToken != null) {
      int amt=0;
      for (int i = 0; i < list.length; i++) {
        String url = baseUrl + username + '/${list[i].toString().toLowerCase()}';///rc
        print(accToken);
        Map<String, String> header = {"Authorization": "Bearer $accToken"};
        http.Response response = await http.post(url, headers: header);
        print(header);
        print(response.body);
        print(url);
        print(response.statusCode);
        if(response.statusCode==200){
          String msg=jsonDecode(response.body)['message'];
          if(msg==null){
            amt=amt+jsonDecode(response.body)['price'];
          }
        }
      }
      if(amt!=0) {
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
        _razorpay.open(options);
      }else{
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
        ? Container(
            child: loader,
            color: Colors.white,
          )
        : Scaffold(
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
                  Text(' 2 items ', style: TextStyle(fontSize: 12, color: Colors.white70),)
                ],
              ),
              backgroundColor: drawerBackgroundColor,
            ),
            body: ListView(
              children: [
                ListView.builder(
                  itemBuilder: (BuildContext context, int pos) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 88,
                              child: AspectRatio(
                                aspectRatio: 0.88,
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF5F6F9),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Image.asset("images/finalLogo.png"),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  list[pos],
                                  style: TextStyle(color: Colors.black, fontSize: 16),
                                  maxLines: 2,
                                ),
                                SizedBox(height: 10),
                                Text(
                                    "\u20B9 100",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600, color: Colors.black),
                                  ),

                              ],
                            ),

                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            setState(() {
                              load = true;
                            });
                            await deleteFromCart(list[pos]);
                          },
                        ),
                      ],
                    );
                  },
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: list.length,
                  shrinkWrap: true,
                ),
              ],
            ),
            bottomNavigationBar: list.length==0?Container():Container(
              padding: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 30,
              ),
              // height: 174,
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -15),
                    blurRadius: 20,
                    color: Color(0xFFDADADA).withOpacity(0.15),
                  )
                ],
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                       Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Color(0xFFF5F6F9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset("images/finalLogo.png"),
                          ),
                          Spacer(),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: "Total:\n",
                              children: [
                                TextSpan(
                                  text: "\u20B9 100",
                                  style: TextStyle(fontSize: 16, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 190,
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
                              color: drawerBackgroundColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            );
  }
}
