import 'package:easypayeasywash/home/home.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class History extends StatefulWidget {
  History({Key? key, required this.userData}) : super(key: key);
  Map<String, dynamic>? userData;

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                              bottomLeft: const Radius.circular(8),
                              bottomRight: const Radius.circular(8))),
                      height: height * 0.07,
                    ),
                  ),
                  Positioned(
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new),
                          iconSize: 30,
                          color: Colors.white,
                          tooltip: 'back',
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.leftToRight,
                                child: Home(
                                  userData: widget.userData,
                                ),
                              ),
                            );
                            print('back');
                          },
                        ),
                        // Text(
                        //   'ย้อนกลับ',
                        //   style: TextStyle(fontSize: 20, color: Colors.white),
                        // ),
                      ],
                    ),
                  ),
                  Center(
                    child: Text(
                      "ประวัติการถอน",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Card(
                    child: ListTile(
                      title: Text('ถอนเงินจำนวน 12000 บาท'),
                      subtitle: Text('2022-05-20 21:55:09'),
                      trailing:
                          Text("สำเร็จ", style: TextStyle(color: Colors.green)),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('ถอนเงินจำนวน 12000 บาท'),
                      subtitle: Text('2022-05-20 21:55:09'),
                      trailing:
                          Text("สำเร็จ", style: TextStyle(color: Colors.green)),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('ถอนเงินจำนวน 12000 บาท'),
                      subtitle: Text('2022-05-20 21:55:09'),
                      trailing:
                          Text("สำเร็จ", style: TextStyle(color: Colors.green)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
