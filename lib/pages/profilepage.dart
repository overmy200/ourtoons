import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ourtoons/pages/homepage.dart';
import 'package:ourtoons/pages/notloginpagehome.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  void signout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final String userEmail = user?.email ?? 'N/A';
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Notloginpage()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Hero(
                    tag: 'me',
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage('https://assetsio.reedpopcdn.com/miles.PNG?width=1200&height=1200&fit=crop&quality=100&format=png&enable=upscale&auto=webp')
                    ),
                  )),
            ],
          ),
          Text('Email: $userEmail', style: TextStyle(fontSize: 25)),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
              child: Text('Home'))
        ],
      )),
    );
  }
}
