import 'package:flutter/material.dart';
import 'package:ourtoons/components/button1.dart';
import 'package:ourtoons/pages/notloginpagehome.dart';


class DesktopFirstPage extends StatelessWidget {
  const DesktopFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.deepPurple[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: 18 / 20,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepPurple[400]!),
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.deepPurple[400],
                    ),
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('The Title',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "'Welcome to our Manga Mania app, the ultimate destination for all manga, manhwa, and comic lovers! Dive into an extensive library of thrilling, heartwarming, and action-packed stories from various genres. Discover an immersive world of captivating characters and intricate plotlines as you explore manga, manhwa, and comics from diverse cultures and artistic styles. Whether you're a fan of romance, fantasy, sci-fi, adventure, or mystery, we've got something for everyone.",
                              style:
                                  TextStyle(fontSize: 35, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(child: Button1(navigateToScreen: Notloginpage()))
            ],
          ),
        ),
      ),
    );
  }
}
