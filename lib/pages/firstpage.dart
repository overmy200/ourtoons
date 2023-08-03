import 'package:flutter/material.dart';
import 'package:ourtoons/components/reponsive.dart';
import 'package:ourtoons/pages/firstpage/theheight1.dart';
import 'package:ourtoons/pages/firstpage/theheight2.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Reponsive(
          desktopbody: DesktopFirstPage(), mobilebody: MobileFirstPage()),
    );
  }
}
