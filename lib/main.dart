import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/screens/main%20screens/nav_screen.dart';

void main(List<String> args) {
  runApp(const ProviderScope(child:  MyApp()));
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
