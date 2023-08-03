import 'package:flutter/material.dart';

class StoryPage extends StatefulWidget {
  final String chapterTitle;
  final List<String> pages;

  StoryPage({
    required this.pages,
    required this.chapterTitle,
  });

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      appBar: AppBar(
        // Use the chapterTitle for the AppBar title
        title: Text(widget.chapterTitle),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            widget.chapterTitle, // Display chapter title here
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Your Story Content Here',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
