import 'package:flutter/material.dart';
import 'package:ourtoons/pages/story/story.dart';

class Hightlight extends StatelessWidget {
  Hightlight({super.key});
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
      backgroundColor: Colors.deepPurple[400],
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: AspectRatio(
                aspectRatio: 4 / 3,
                child: Hero(
                    tag: 'meme',
                    child: Image.network(
                        'https://www.crunchyroll.com/imgsrv/display/thumbnail/1200x675/catalog/crunchyroll/1ecde018e863e2aaee31f00a23378c35.jpe'))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                size: 40,
                color: Colors.yellow,
              ),
              SizedBox(
                width: 15,
              ),
              Text('One piece',
                  style: TextStyle(
                      color: Colors.yellow, fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(height: 30),
          Expanded(
              child: ListView.builder(
                  itemCount: chapters.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(chapters[index],
                                  style: TextStyle(
                                      color: Colors.yellow,
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold))
                            ]),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StoryPage()));
                        });
                  }))
        ],
      ),
    );
  }
}
