import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {


  final storage=FlutterSecureStorage();
  List list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
    print(list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: ,
    );
  }
}
