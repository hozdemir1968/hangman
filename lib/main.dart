import 'package:flutter/material.dart';
import 'package:hangman/pages/score_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'homePage',
      routes: {
        'homePage': (context) => HomePage(),
        'scorePage': (context) => ScorePage(),
      },
    );
  }
}
