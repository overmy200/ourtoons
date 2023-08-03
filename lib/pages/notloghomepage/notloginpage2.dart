import 'package:flutter/material.dart';
import 'package:ourtoons/pages/Onpiece/change.dart';
import 'package:ourtoons/pages/Onpiece/hightlight.dart';
import 'package:ourtoons/pages/homepage/mobile.dart';
import 'package:ourtoons/pages/loginpage.dart';

class Notlogin2 extends StatefulWidget {
  const Notlogin2({Key? key});

  @override
  State<Notlogin2> createState() => _Notlogin2State();
}


class _Notlogin2State extends State<Notlogin2> {
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyLoginPageMobile()));
              },
              icon: Icon(
                Icons.account_circle,
                size: 35,
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
                    aspectRatio: 5 / 4,
                    child: Ink.image(
                      image: NetworkImage(item.urlItem),
                      fit: BoxFit.cover,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ChangePage(item: item)));
                        },
                      ),
                    ))),
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
