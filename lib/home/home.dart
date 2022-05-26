// ignore_for_file: must_be_immutable, avoid_print, prefer_const_constructors,

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key, required this.userData}) : super(key: key);
  Map<String, dynamic>? userData;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                              "1000000555",
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
                            child: Text(
                              "3000000000000",
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
                      "จำนวนเครื่องซักผ้า",
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
                                subtitle: Text(
                                    'เครื่องหน้าหอ'),
                                trailing: Icon(Icons.navigate_next_rounded),
                                isThreeLine: true,
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
