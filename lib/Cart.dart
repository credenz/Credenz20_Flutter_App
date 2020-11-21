import 'dart:async';

import 'package:credenz20/constants/EventData.dart';
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


  final storage=FlutterSecureStorage();
  List list;
  bool load=true;
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

  loadCart()async{
    list=List();
    for(int i=0;i<12;i++){
      bool pre=await storage.containsKey(key: '$i');
      if(pre){
        String eventName=await storage.read(key: '$i');
        list.add(eventName);
      }
    }
    setState(() {
      load=false;
    });
    print(list);
  }

  deleteFromCart(String title)async{
    int pos=eventName.indexOf(title);
    await storage.delete(key: '$pos');
    await loadCart(); 
    setState(() {
      load=false;
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

  @override
  Widget build(BuildContext context) {
    return load==true?Container(child: loader,color: Colors.white,):Scaffold(
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
        title: Text('Cart'),
        backgroundColor: drawerBackgroundColor,
      ),
      body: ListView(
        children: [
          ListView.builder(itemBuilder: (BuildContext context,int pos){
            return ListTile(
              title: Text(list[pos]),
              trailing: IconButton(icon: Icon(Icons.delete),onPressed: ()async{
                setState(() {
                  load=true;
                });
                await deleteFromCart(list[pos]);
              },),
            );
          },
            physics: NeverScrollableScrollPhysics(),
          itemCount: list.length,
          shrinkWrap: true,),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: (){
                  var options = {
                    'key': 'rzp_test_8OXCvHsV5OiOpe',
                    'amount': 100,
                    'name': 'Acme Corp.',
                    'description': 'Fine T-Shirt',
                    'prefill': {
                      'contact': '7397865565',
                      'email': 'sarafatharva123@gmail.com'
                    }
                  };
                  _razorpay.open(options);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Text('Register',style: TextStyle(color: Colors.white),),
                ),
                color: drawerBackgroundColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
