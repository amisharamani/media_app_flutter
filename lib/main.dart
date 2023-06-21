import 'package:flutter/material.dart';
import 'package:media_booster/play_song.dart';
import 'package:media_booster/video_play.dart';

import 'homepage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   useMaterial3: true,
      // ),
      darkTheme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(color: Colors.black),
        colorScheme: ColorScheme.dark(
          brightness: Brightness.dark,
          primary: Colors.green,
          secondary: Colors.green,
        ),
      ),

      themeMode: ThemeMode.dark,
      routes: {
        '/': (context) => HomePage(),
        'playSong': (context) => playSong(),
        'videopage': (context) => videopage(),
      },
    ),
  );
}
