import 'package:flutter/material.dart';

class QueryWid extends StatelessWidget {
  const QueryWid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Height:" + MediaQuery.of(context).size.height.toString()),
              Text("Width:" + MediaQuery.of(context).size.width.toString()),
              Text("Retio:" +
                  MediaQuery.of(context).size.aspectRatio.toStringAsFixed(2)),
              Text(MediaQuery.of(context).orientation.toString())
            ]),
      ),
    );
  }
}
