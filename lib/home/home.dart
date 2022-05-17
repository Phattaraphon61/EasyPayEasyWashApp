// ignore_for_file: must_be_immutable, avoid_print

import 'package:easypayeasywash/login/login.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Text("Test"),
          Text('TEST'),
          TextButton(
            onPressed: () {
              print(widget.userData);
            },
            child: Text('onpressed'),
          )
        ],
      )),
    );
  }
}
