import 'package:flutter/material.dart';
//import 'package:youtube_clone/screens/home_page/youtube_home.dart';
import 'package:flutter/services.dart';
import 'package:youtube_clone/screens/main%20screens/nav_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
        title: 'youtube clone',
        theme: ThemeData(
            brightness: Brightness.dark,
            bottomNavigationBarTheme:
              const  BottomNavigationBarThemeData(selectedItemColor: Colors.white)),
        home: const NavScreen());
  }
}
