// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:easypayeasywash/selectbank/seleckbank.dart';
import 'package:easypayeasywash/withdrawal/withdrawal.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Createbank extends StatefulWidget {
  Createbank(
      {Key? key,
      required this.userData,
      required this.namebank,
      required this.engbank})
      : super(key: key);
  Map<String, dynamic>? userData;
  String namebank;
  String engbank;

  @override
  State<Createbank> createState() => _CreatebankState();
}

class _CreatebankState extends State<Createbank> {
  List<bool> isSelected = [true, false];
  numtostar(num) {
    var tt = [];
    for (int i = 0; i < num.length; i++) {
      if (num.length - i <= 3) {
        tt.add(num[i]);
      } else {
        tt.add("*");
      }
      if (i + 1 == num.length) {
        return tt.join().toString();
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.namebank != "0") {
      setState(() {
        isSelected[0] = false;
        isSelected[1] = true;
      });
    }
  }

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
                                child: Withdrawal(
                                  userData: widget.userData,
                                  bank: '0',
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
                      "บัญชีธนาคาร",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: ToggleButtons(
                  children: <Widget>[
                    SizedBox(
                        width: width * 0.49,
                        child: Center(
                            child: Text(
                          "บัญชีของฉัน",
                          style: TextStyle(fontSize: 20),
                        ))),
                    SizedBox(
                        width: width * 0.4,
                        child: Center(
                            child: Text(
                          "สร้างบัญชี",
                          style: TextStyle(fontSize: 20),
                        ))),
                  ],
                  onPressed: (int index) {
                    setState(() {
                      print(index);
                      for (int buttonIndex = 0;
                          buttonIndex < isSelected.length;
                          buttonIndex++) {
                        if (buttonIndex == index) {
                          isSelected[buttonIndex] = true;
                        } else {
                          isSelected[buttonIndex] = false;
                        }
                      }
                    });
                  },
                  isSelected: isSelected,
                ),
              ),
              isSelected[0] == true
                  ? Column(children: [
                      GestureDetector(
                        onTap: () {
                          print("YES");
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.leftToRight,
                              child: Withdrawal(
                                userData: widget.userData,
                                bank: '1',
                              ),
                            ),
                          );
                        },
                        child: Card(
                          child: ListTile(
                            leading: Image.asset('assets/images/scb.png'),
                            title: Text('นาย ภัทรพล ผิวเรือง'),
                            subtitle: Text(
                                'ธนาคารไทยพาณิชย์ ' + numtostar("4078580533")),
                            trailing: Icon(Icons.navigate_next_rounded),
                          ),
                        ),
                      ),
                    ])
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          widget.namebank == "0"
                              ? GestureDetector(
                                  onTap: () {
                                    print("YES");
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: Selectbank(
                                          userData: widget.userData,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Card(
                                    child: ListTile(
                                      title: Text('เลือกบัญชีธนาคาร'),
                                      // subtitle: Text('เครื่องหน้าหอ'),
                                      trailing:
                                          Icon(Icons.navigate_next_rounded),
                                    ),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    print("YES");
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: Selectbank(
                                          userData: widget.userData,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Card(
                                    child: ListTile(
                                      leading:
                                          Image.asset('assets/images/${widget.engbank}.png'),
                                      title: Text(widget.namebank),
                                      // subtitle: Text('เครื่องหน้าหอ'),
                                    ),
                                  ),
                                ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text("ชื่อบัญชี"),
                                hintText: 'กรอกชื่อบัญชี',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text("เลขที่บัญชี"),
                                hintText: 'กรอกเลขที่บัญชี',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                print("YES");
                              },
                              child: Container(
                                // ignore: unnecessary_new
                                decoration: new BoxDecoration(
                                    color: Color.fromARGB(255, 97, 222, 253),
                                    // ignore: unnecessary_new
                                    borderRadius: new BorderRadius.only(
                                        topLeft: const Radius.circular(48.0),
                                        topRight: const Radius.circular(48.0),
                                        bottomLeft: const Radius.circular(48.0),
                                        bottomRight:
                                            const Radius.circular(48.0))),
                                width: width * 0.7,
                                height: height * 0.06,
                                child: Center(
                                  child: Text(
                                    "เพิ่มบัญชีธนาคาร",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
