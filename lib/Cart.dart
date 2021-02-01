import 'dart:convert';
import 'package:upi_india/upi_india.dart';
import 'package:credenz20/constants/API.dart';
import 'package:credenz20/constants/EventData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

// import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'External_Package/RaisedGradientButton.dart';
import 'constants/theme.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final storage = FlutterSecureStorage();
  int sum = 0;
  List list=List();
  List<bool>grpEvent=[];
  List<String>grpName;
  List<String>user2;
  List<String>user3;
  List list1=List();
  bool load = true;
  UpiIndia _upiIndia = UpiIndia();
  List<UpiApp> apps;

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
    // getEventPrices();
    _upiIndia.getAllUpiApps().then((value) {
      setState(() {
        apps = value;
      });
    });
    loadCart();
  }
  //
  // getEventPrices() async {
  //   prices1 = new Map();
  //   String url = allEventUrl;
  //   http.Response response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     List list = jsonDecode(response.body) as List;
  //     for (int i = 0; i < list.length; i++) {
  //       prices1[list[i]['event_name']] = list[i]['event_price'];
  //     }
  //     await loadCart();
  //   }else{
  //     setState(() {
  //       load=false;
  //       Navigator.pop(context);
  //     });
  //   }
  // }

  loadCart() async {
    sum = 0;
    children1.clear();
    grpEvent=[];
    grpName=[];
    user2=[];
    String ieee=await storage.read(key: 'ieee');
    user3=[];
    list = List();
    for (int i = 0; i < 12; i++) {
      bool pre = await storage.containsKey(key: '$i');
      if (pre) {
        String eventName = await storage.read(key: '$i');
        bool b=await storage.containsKey(key: '${i}grp');
        grpEvent.add(b);
        if(b){
          String name=await storage.read(key: '${i}grp');
          grpName.add(name);
          bool c=await storage.containsKey(key: '${i}part2');
          if(c){
            String us2=await storage.read(key: '${i}part2');
            user2.add(us2);
          }else{
            user2.add(' ');
          }
          bool d=await storage.containsKey(key: '${i}part3');
          if(d){
            String us2=await storage.read(key: '${i}part3');
            user3.add(us2);
          }else{
            user3.add(' ');
          }
        }else{
          user2.add(' ');
          user3.add(' ');
          grpName.add(' ');
        }
        list.add(eventName);
        ieee=='true'?list1.add(ieeePrices[i]):list1.add(nonIeeePrices[i]);
         sum +=  ieee=='true'?ieeePrices[i]:nonIeeePrices[i];
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
                colors: commonGradient,
              ), //[Color(0xff615de3), Color(0xff6c73ed)]),
              //color: Colors.purple,
            ),
            child: eventName.indexOf(list[i], 0)==-1?Container():Image.asset(
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
    if(apps.isEmpty){
      Fluttertoast.showToast(msg: 'No UPI apps found',backgroundColor: Colors.blue.shade600);
      return;
    }
     UpiResponse upiResponse=await _upiIndia.startTransaction(
      app: apps[0],
      receiverUpiId: '9834570868@okbizaxis',
      //  I took only the first app from List<UpiApp> app.
      // receiverId: 'tester@test', // Make Sure to change this UPI Id
      receiverName: 'PISB',
      transactionRefId: 'PISB ID',
      transactionNote: 'Event payment',
      amount: sum.toDouble(),
    );
     // Fluttertoast.showToast(msg: upiResponse.status);
     // print(upiResponse.transactionId);
     // print(upiResponse.status);
    if(upiResponse.status=='success'){
      String an="";
      String username = await storage.read(key: 'username');
      String accToken = await storage.read(key: "accToken");
      for (int i = 0; i < list.length; i++) {
        print(list[i]);
        print(grpEvent[i]);
        if(grpEvent[i]){
          print(user2[i]);
          print(user3[i]);}
        if(grpEvent[i]==false) {
          String url =
              baseUrl + username + '/${list[i].toString().toLowerCase()}';
          print(accToken);
          Map<String,dynamic>mapp={
            "approved":true,
            "trans_id":"T2101292246376173901775"
          };
          String body='{"approved":true,"trans_id":"T2101292246376173901775"}';
          print(body);
          Map<String, String> header = {"Authorization": "Bearer $accToken","Content-Type":"application/json"};
          http.Response response = await http.post(url, headers: header,body: body);
          print(header);
          print(response.body);
          print(url);
          print(response.statusCode);
          if (response.statusCode == 201||response.statusCode == 200) {
            print(response.body);
            String msg = jsonDecode(response.body)['message'];
            if (msg == null) {
            }
          }else{
            an=an+list[i]+" ";
          }
        }else{
          String url=groupRegisterUrl;
          int nop=1;
          List<String>ls=[];
          if(user2[i]!=" "){
            nop++;
            ls.add('"${user2[i]}"');
          }
          if(user3[i]!=" "){
            nop++;
            ls.add("${user3[i]}");
          }
          String body='{"event_name":"${list[i].toString().toLowerCase()}","team_username":"${grpName[i]}","players":$ls,"no_of_players":$nop,"approved":true,"trans_id":"T2101292246376173901775"}';
          Map<String, String> header = {"Authorization": "Bearer $accToken","Content-Type":"application/json"};
          http.Response response=await http.post(url,headers: header,body: body);
          print(url);
          print(header);
          print(body);
          print(response.body);
          if(response.statusCode==200||response.statusCode==201){
            print(response.body);
          }else{
            an=an+list[i]+" ";
          }
        }
      }
      if(an==""){
        for(int i=0;i<12;i++){
          if(await storage.containsKey(key: '$i')){
            await storage.delete(key: '$i');

          }
        };
        await loadCart();
        Fluttertoast.showToast(msg: "Events registered",backgroundColor: Colors.blue.shade600);

      }else{
        Fluttertoast.showToast(msg: "Error in registration for $an",backgroundColor: Colors.blue.shade600);
      }
    }else if(upiResponse.status=='failure'){
      Fluttertoast.showToast(msg: 'Payment Failed',backgroundColor: Colors.blue.shade600);
    }else{
      Fluttertoast.showToast(msg: 'Payment ${upiResponse.status}',backgroundColor: Colors.blue.shade600);
    }


    /*  var response = AllInOneSdk.startTransaction(
        mid, orderId, "100", txnToken, null, isStaging, restrictAppInvoke);
    response.then((value) {
      print(value);
      setState(() {
        result = value.toString();
      });
    }).catchError((onError) {
      if (onError is PlatformException) {
        setState(() {
          result = onError.message + " \n  " + onError.details.toString();
        });
      } else {
        setState(() {
          result = onError.toString();
        });
      }
    });
    
    */

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
                  Text(' Your Cart',style: TextStyle(fontFamily: 'Segoe UI',),),
                ],
              ),
              backgroundColor: primary,
            ),
            body: Container(
                //color: notiBackColor,
                child: Center(
                  child: Container(
                    child: loader1,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/contactb.jpg"),
                          fit: BoxFit.fill,
                        )),
                  ),
                )),
          )
        : Container(
            height: MediaQuery.of(context).size.height,
            decoration: list.length == 0
                ? BoxDecoration(
                    color: backColor,
                    image: DecorationImage(
                      image: AssetImage("images/cartimage.png"),
                      fit: BoxFit.scaleDown,
                    )                 // gradient: LinearGradient(colors: [Color.fromRGBO(0, 0, 0, 0), Color.fromRGBO(0, 0, 0, 0)], stops: [0, 1])
                    )
                : BoxDecoration(
                    color: backColor,
                    image: DecorationImage(
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
                      Text(' Your Cart',style: TextStyle(fontFamily: 'Segoe UI',),),
                      Text(
                        ' ${list.length} items ',
                        style: TextStyle(fontSize: 12, color: Colors.white70,fontFamily: 'Segoe UI',),
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
                          eventName.indexOf(list[pos], 0)==-1?null:eventimages[eventName.indexOf(list[pos], 0)];
                          return Card(
                            color: Color(0x221f67de),
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
                                          child: eventName.indexOf(list[pos], 0)==-1?Container():Image.asset(ig.assetName),
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
                                              fontFamily: 'Segoe UI',
                                              color: textColor, fontSize: 16),
                                          maxLines: 2,
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                         "\u20B9 ${list1[pos]} ",
                                          style: TextStyle(
                                              fontFamily: 'Segoe UI',
                                              fontWeight: FontWeight.w600,
                                              color: textColor),
                                        ),
                                        SizedBox(height: 5),
                                        grpEvent[pos]?Text(
                                          "Group: ${grpName[pos]}",
                                          style: TextStyle(
                                              fontFamily: 'Segoe UI',
                                              fontWeight: FontWeight.w600,
                                              color: textColor),
                                        ):Text('Solo',style: TextStyle(
                                            fontFamily: 'Segoe UI',
                                            fontWeight: FontWeight.w600,
                                            color: textColor),),
                                      ],
                                    ),
                                  ],
                                ),
                                IconButton(
                                  color: textColor,
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
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.5),
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
                                          fontFamily: 'Segoe UI',
                                          fontSize: 16, color: Colors.white),
                                      children: [
                                        TextSpan(
                                          text: "\u20B9 " + sum.toString(),
                                          style: TextStyle(
                                              fontFamily: 'Segoe UI',
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 170,
                                    child: RaisedGradientButton(
                                        height: 40.0,
                                        width: 40.0,
                                        child: Text(
                                          'Register',
                                          style: TextStyle(color: Colors.white,fontFamily: 'Segoe UI',),
                                        ),
                                        gradient: LinearGradient(
                                          colors: commonGradient,
                                        ),
                                        onPressed: ()  async{
                                          await pay();
                                          // Fluttertoast.showToast(
                                          //     backgroundColor: Colors.blue.shade600,
                                          //     msg: 'Payment gateway will open soon. Stay tuned!');
                                        }),

                                    /*child: RaisedButton(
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
                                    ),*/
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
