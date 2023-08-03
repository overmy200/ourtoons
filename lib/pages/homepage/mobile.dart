import 'package:flutter/material.dart';
import 'package:ourtoons/pages/Onpiece/change.dart';
import 'package:ourtoons/pages/Onpiece/hightlight.dart';
import 'package:ourtoons/pages/profilepage.dart';

class MyMobile extends StatefulWidget {
  const MyMobile({super.key});

  @override
  State<MyMobile> createState() => _MyMobileState();
}

class CardItem {
  final String urlItem;
  final String titleItem;

  CardItem({required this.titleItem, required this.urlItem});
}

class _MyMobileState extends State<MyMobile> {
  List<CardItem> item = [
    CardItem(
        titleItem: 'Solo Leveling',
        urlItem:
            'https://hedwig-cf.netmarble.com/forum-common/sololv/slv_th/thumbnail/f3450c1bcf3d4f49b70f4e4f5d5d35f2_1679558381344_lp.jpg'),
    CardItem(
        titleItem: 'JoJo 7 SBR',
        urlItem:
            'https://static.wikia.nocookie.net/ninjajojos-bizarre-adventure/images/2/2b/Volume_81.jpg/revision/latest?cb=20210606194302'),
    CardItem(
        titleItem: 'Naruto',
        urlItem:
            'https://m.media-amazon.com/images/M/MV5BZmQ5NGFiNWEtMmMyMC00MDdiLTg4YjktOGY5Yzc2MDUxMTE1XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_FMjpg_UX1000_.jpg')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              icon: Hero(
                tag: 'me',
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://assetsio.reedpopcdn.com/miles.PNG?width=1200&height=1200&fit=crop&quality=100&format=png&enable=upscale&auto=webp'),
                ),
              ))
        ],
        automaticallyImplyLeading: false,
        title: const Center(child: Text('O U R T O O N S')),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Hightlight()));
                            },
                            icon: Hero(tag: 'meme',
                              child: Image.network(
                                  "https://www.crunchyroll.com/imgsrv/display/thumbnail/1200x675/catalog/crunchyroll/1ecde018e863e2aaee31f00a23378c35.jpe"),
                            ),
                          )),
                    ),
                    Container(
                        height: 170,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, _) =>
                                SizedBox(width: 5),
                            itemCount: item.length,
                            itemBuilder: (context, index) =>
                                buildCard(item: item[index]))),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCard({required CardItem item}) => Container(
        width: 200,
        child: Column(
          children: [
            Expanded(
                child: AspectRatio(
                            aspectRatio: 4 / 3,
                            child: Ink.image(
                image: NetworkImage(item.urlItem),
                fit: BoxFit.cover,
                child: InkWell(onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePage(item: item)));
                }),
                            ),
                          )),
            SizedBox(
              height: 5,
            ),
            Text(item.titleItem,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))
          ],
        ),
      );
}
