import 'package:flutter/material.dart';
import 'package:ourtoons/pages/homepage/mobile.dart';

class ChangePage extends StatefulWidget {
  final CardItem item;
  ChangePage({Key? key, required this.item}) : super(key: key);

  @override
  State<ChangePage> createState() => _ChangePageState();
}

class _ChangePageState extends State<ChangePage> {
  final List<String> chapters = [
    'Chapter 1',
    'Chapter 2',
    'Chapter 3',
    'Chapter 4',
    'Chapter 5',
    'Chapter 6',
    'Chapter 7',
    'Chapter 8',
    'Chapter 9',
    'Chapter 10'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: AspectRatio(
              aspectRatio: 10 / 9,
              child: Image.network(
                widget.item
                    .urlItem, // Use widget.item.urlItem to access the item variable
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(widget.item.titleItem,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: chapters.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(chapters[index],
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  onTap: () {
                    print('Chapter ${index + 1} tapped.');
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
