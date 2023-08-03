import 'package:flutter/material.dart';

import 'package:ourtoons/components/reponsive.dart';
import 'package:ourtoons/pages/homepage/desktop.dart';
import 'package:ourtoons/pages/homepage/mobile.dart';

class MyHomePage extends StatefulWidget {

  MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Reponsive(desktopbody: MyDesktop(), mobilebody: MyMobile()),
    );
  }
}
