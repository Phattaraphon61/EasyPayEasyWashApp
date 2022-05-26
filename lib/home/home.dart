// ignore_for_file: must_be_immutable, avoid_print, prefer_const_constructors,

import 'package:easypayeasywash/addwashing/addwashing.dart';
import 'package:easypayeasywash/withdrawal/withdrawal.dart';
import 'package:flutter/services.dart';
// import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatefulWidget {
  Home({Key? key, required this.userData}) : super(key: key);
  Map<String, dynamic>? userData;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _scanBarcode = 'Unknown';
  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
      if (barcodeScanRes != "-1") {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.leftToRight,
            child: Addwashing(
              userData: widget.userData,
              id: barcodeScanRes,
            ),
          ),
        );
      }
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Positioned(
                  child: Container(
                    // ignore: unnecessary_new
                    decoration: new BoxDecoration(
                        color: Color.fromRGBO(84, 199, 199, 1),
                        // ignore: unnecessary_new
                        borderRadius: new BorderRadius.only(
                            bottomLeft: const Radius.circular(48.0),
                            bottomRight: const Radius.circular(48.0))),
                    height: height * 0.3,
                  ),
                ),
                Positioned(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Image.asset('assets/images/scan.png'),
                        tooltip: 'scan',
                        onPressed: () async {
                          print('scann');
                          scanQR();
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.notification_important),
                        iconSize: 30,
                        tooltip: 'scan',
                        onPressed: () {
                          print('noti');
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Positioned(
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: width * 0.04, top: height * 0.013),
                        child: Container(
                          // ignore: unnecessary_new
                          decoration: new BoxDecoration(
                              color: Color.fromARGB(255, 231, 26, 26),
                              // ignore: unnecessary_new
                              shape: BoxShape.circle),
                          height: 8,
                          width: 8,
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    "จ่ายง่ายได้ซัก",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.18),
                  child: Center(
                    child: Container(
                        width: width * 0.8,
                        height: height * 0.2,
                        // ignore: unnecessary_new
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                // ignore: unnecessary_new
                                new BorderRadius.all(Radius.circular(23)),
                            // ignore: prefer_const_literals_to_create_immutables
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 10,
                                offset: Offset(1, 8),
                              )
                            ])),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.1),
                  child: Center(
                    child: Column(
                      children: [
                        ClipOval(
                            child: Image.network(
                          widget.userData!['picture']['data']['url'],
                          fit: BoxFit.contain,
                          matchTextDirection: true,
                          height: height * 0.13,
                        )),
                        Text(
                          widget.userData!['name'],
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceEvenly, //Center Row contents horizontally,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "ยอดสุทธิ",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: height * 0.01),
                            child: Text(
                             NumberFormat("#,###").format(1000000555),
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "ยอดรวม",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: height * 0.01),
                            child:  Text(
                             NumberFormat("#,###").format(3000000000000),
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.4),
                  child: Center(
                    child: Text(
                      "เครื่องซักผ้าทั้งหมด",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.45),
                  child: Container(
                    height: height * 0.42,
                    child: ListView(
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              print("YES");
                            },
                            child: Card(
                              child: ListTile(
                                leading: Image.asset('assets/images/washing.png'),
                                title: Text('EPEW-123456'),
                                subtitle: Text('เครื่องหน้าหอ'),
                                trailing: Icon(Icons.navigate_next_rounded),
                              ),
                            ),
                          )
                        ]),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  // ignore: unnecessary_new
                  decoration: new BoxDecoration(
                      color: Color.fromRGBO(84, 199, 199, 1),
                      // ignore: unnecessary_new
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(15.0),
                          topRight: const Radius.circular(15.0))),
                  height: height * 0.08,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Positioned(
                        child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.05,
                          child: IconButton(
                            padding: EdgeInsets.all(0.0),
                            icon: Image.asset('assets/images/history.png'),
                            onPressed: () {
                              print("history");
                            },
                          ),
                        ),
                        Text(
                          "ประวัติการถอน",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )
                      ],
                    )),
                    Positioned(
                        child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.05,
                          child: IconButton(
                            padding: EdgeInsets.all(0.0),
                            icon: Image.asset('assets/images/withdrawal.png'),
                            onPressed: () {
                              print("withdrawal");
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: Withdrawal(
                                    userData: widget.userData,
                                    bank: "0",
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Text(
                          "ถอน",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )
                      ],
                    )),
                    Positioned(
                        child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.05,
                          child: IconButton(
                            padding: EdgeInsets.all(0.0),
                            icon: Image.asset('assets/images/signout.png'),
                            onPressed: () {
                              print('signout');
                            },
                          ),
                        ),
                        Text(
                          "ออกจากระบบ",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )
                      ],
                    )),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
