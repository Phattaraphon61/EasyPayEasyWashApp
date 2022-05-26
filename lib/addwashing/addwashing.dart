import 'package:flutter/material.dart';

class Addwashing extends StatefulWidget {
  Addwashing({Key? key, required this.userData, required this.id})
      : super(key: key);
  Map<String, dynamic>? userData;
  String id;

  @override
  State<Addwashing> createState() => _AddwashingState();
}

class _AddwashingState extends State<Addwashing> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new),
                        iconSize: 30,
                        color: Colors.white,
                        tooltip: 'back',
                        onPressed: () {
                          Navigator.pop(context);
                          print('back');
                        },
                      ),
                      Text(
                        'ย้อนกลับ',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.1),
                    child: Center(
                      child: Text(
                        "เพิ่มเครื่องซักผ้า",
                        style: TextStyle(fontSize: 45),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: height * 0.35),
                        child: Center(
                            child: Image.asset('assets/images/washing.png',
                                width: 153, height: 153, fit: BoxFit.fill)),
                      ),
                      Center(
                        child: Text(
                          'ID : ${widget.id}',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'คำอธิบาย',
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("YES");
                        },
                        child: Container(
                          decoration: new BoxDecoration(
                              color: Color.fromARGB(255, 97, 222, 253),
                              // ignore: unnecessary_new
                              borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(48.0),
                                  topRight: const Radius.circular(48.0),
                                  bottomLeft: const Radius.circular(48.0),
                                  bottomRight: const Radius.circular(48.0))),
                          width: width * 0.7,
                          height: height * 0.06,
                          child: Center(
                            child: Text(
                              "เพิ่ม",
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              // Stack(
              //   children: [
              //     Container(
              //       // ignore: unnecessary_new
              //       decoration: new BoxDecoration(
              //           color: Color.fromRGBO(84, 199, 199, 1),
              //           // ignore: unnecessary_new
              //           borderRadius: new BorderRadius.only(
              //               topLeft: const Radius.circular(15.0),
              //               topRight: const Radius.circular(15.0))),
              //       height: height * 0.08,
              //     ),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       children: [
              //         Positioned(
              //             child: Column(
              //           children: [
              //             SizedBox(
              //               height: height * 0.05,
              //               child: IconButton(
              //                 padding: EdgeInsets.all(0.0),
              //                 icon: Image.asset('assets/images/history.png'),
              //                 onPressed: () {
              //                   print("history");
              //                 },
              //               ),
              //             ),
              //             Text(
              //               "ประวัติการถอน",
              //               style: TextStyle(
              //                 fontSize: 14,
              //               ),
              //             )
              //           ],
              //         )),
              //         Positioned(
              //             child: Column(
              //           children: [
              //             SizedBox(
              //               height: height * 0.05,
              //               child: IconButton(
              //                 padding: EdgeInsets.all(0.0),
              //                 icon: Image.asset('assets/images/withdrawal.png'),
              //                 onPressed: () {
              //                   print("withdrawal");
              //                 },
              //               ),
              //             ),
              //             Text(
              //               "ถอน",
              //               style: TextStyle(
              //                 fontSize: 14,
              //               ),
              //             )
              //           ],
              //         )),
              //         Positioned(
              //             child: Column(
              //           children: [
              //             SizedBox(
              //               height: height * 0.05,
              //               child: IconButton(
              //                 padding: EdgeInsets.all(0.0),
              //                 icon: Image.asset('assets/images/signout.png'),
              //                 onPressed: () {
              //                   print('signout');
              //                 },
              //               ),
              //             ),
              //             Text(
              //               "ออกจากระบบ",
              //               style: TextStyle(
              //                 fontSize: 14,
              //               ),
              //             )
              //           ],
              //         )),
              //       ],
              //     )
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
