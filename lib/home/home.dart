// ignore_for_file: must_be_immutable, avoid_print

import 'package:easypayeasywash/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'dart:math' as math show pi;

import 'package:collapsible_sidebar/collapsible_sidebar.dart';

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
          children: [
            Stack(
              children: [
                Container(
                  decoration: new BoxDecoration(
                      color: Color.fromRGBO(84, 199, 199, 1),
                      borderRadius: new BorderRadius.only(
                          bottomLeft: const Radius.circular(48.0),
                          bottomRight: const Radius.circular(48.0))),
                  height: height * 0.35,
                ),
                Center(
                  child: Text(
                    "จ่ายง่ายได้ซัก",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.25),
                  child: Center(
                    child: Container(
                        width: width * 0.8,
                        height: height * 0.2,
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                new BorderRadius.all(Radius.circular(23)),
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
                  padding: EdgeInsets.only(top: height * 0.18),
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
                          style: TextStyle(fontSize: 18,),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
