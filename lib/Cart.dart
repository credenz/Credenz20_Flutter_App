import 'dart:async';

import 'package:credenz20/constants/EventData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
    // Do something when payment succeeds
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
              title: Text(list[pos%2]),
              trailing: IconButton(icon: Icon(Icons.delete),onPressed: ()async{
                setState(() {
                  load=true;
                });
                await deleteFromCart(list[pos]);
              },),
            );
          },
            physics: NeverScrollableScrollPhysics(),
          itemCount: 20,
          shrinkWrap: true,),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: (){
                  _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
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
