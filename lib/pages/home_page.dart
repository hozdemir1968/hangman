import 'package:flutter/material.dart';
import 'package:hangman/tools/hangman_words.dart';
import 'package:hangman/pages/play_game.dart';
import 'package:hangman/pages/score_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  final HangmanWords hangmanWords = HangmanWords();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    widget.hangmanWords.readWords();
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.fromLTRB(8.0, 1.0, 8.0, 8.0),
              child: const Text(
                'HANGMAN',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 58.0,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 3.0),
              ),
            ),
          ),
          Center(
            child: Container(
              child: Image.asset(
                'images/gallow.png',
                height: height * 0.49,
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          Center(
            child: IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      height: 64,
                      child: ElevatedButton(
                        child: const Text(
                          'Start',
                          style: TextStyle(fontSize: 26),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlayGame(
                                hangmanObject: widget.hangmanWords,
                              ),
                            ),
                          );
                        },
                      )),
                  const SizedBox(height: 18.0),
                  Container(
                      height: 64,
                      child: ElevatedButton(
                        child: const Text(
                          'High Scores',
                          style: TextStyle(fontSize: 26),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScorePage(),
                            ),
                          );
                        },
                      )),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
