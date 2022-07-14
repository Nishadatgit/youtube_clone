import 'package:flutter/material.dart';
import 'package:youtube_clone/screens/home_page/youtube_home.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'youtube clone',
      theme: ThemeData.dark(),
      home: YoutubeHome()
    );
  }
}
