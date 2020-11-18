import 'dart:async';

import 'package:credenz20/constants/EventData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCart();
  }

  loadCart()async{
    list=List();
    Timer(Duration(seconds: 3), (){

    });
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
      body: ListView.builder(itemBuilder: (BuildContext context,int pos){
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
      itemCount: list.length,),
    );
  }
}
