import 'package:flutter/material.dart';

import 'package:ourtoons/components/reponsive.dart';
import 'package:ourtoons/pages/notloghomepage/notloginpage2.dart';
import 'package:ourtoons/pages/notloghomepage/notloginpagehome1.dart';


class Notloginpage extends StatelessWidget {
  Notloginpage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Reponsive(desktopbody: Notlogin1(), mobilebody: Notlogin2()),
    );
  }
}
