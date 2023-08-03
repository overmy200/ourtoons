import 'package:flutter/material.dart';

class Button1 extends StatelessWidget {
  final Widget navigateToScreen;

  Button1({super.key, required this.navigateToScreen});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => navigateToScreen));
      },
      child: Container(
        width: 300,
        height: 80,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.deepPurple[400]!, width: 10),
            borderRadius: BorderRadius.circular(30),
            color: Colors.deepPurple[400]),
        child: Center(
            child: Text('Get Start',
                style: TextStyle(
                  color: Colors.white,
                ))),
      ),
    );
  }
}
