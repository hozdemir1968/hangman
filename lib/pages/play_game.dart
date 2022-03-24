import 'package:flutter/material.dart';
import 'package:hangman/tools/colors.dart';
import 'package:hangman/tools/figure_image.dart';
import 'package:hangman/tools/word.dart';
import 'package:hangman/tools/hangman_words.dart';

class PlayGame extends StatefulWidget {
  final HangmanWords? hangmanObject;
  const PlayGame({Key? key, this.hangmanObject}) : super(key: key);

  @override
  _PlayGameState createState() => _PlayGameState();
}

class _PlayGameState extends State<PlayGame> {
  int tries = 0;
  List<String> selectedChar = [];
  String alphabet = "ABCÇDEFGĞHIİJKLMNOÖPRSŞTUÜVYZ";
  String wordSelected = "hello";
  bool newGame = true;
  bool isGameOver = false;

  @override
  void initState() {
    initGame();
    super.initState();
  }

  void initGame() {
    if (newGame) {
      widget.hangmanObject!.readWords();
      wordSelected = widget.hangmanObject!.getWord()!.toUpperCase();
      print(wordSelected);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> alphabets = alphabet.split('');
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        title: const Text("HangmaN"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        leading: Text('Hata: ${tries.toString()}'),
      ),
      body: isGameOver
          ? const Center(
              child: Text(
                ' !!! GAME OVER !!!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Stack(
                    children: [
                      figureImage(tries >= 0, "images/hang.png"),
                      figureImage(tries >= 1, "images/head.png"),
                      figureImage(tries >= 2, "images/body.png"),
                      figureImage(tries >= 3, "images/ra.png"),
                      figureImage(tries >= 4, "images/la.png"),
                      figureImage(tries >= 5, "images/rl.png"),
                      figureImage(tries >= 6, "images/ll.png"),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: wordSelected
                          .split('')
                          .map((e) => word(e.toUpperCase(),
                              !selectedChar.contains(e.toUpperCase())))
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 300.0,
                  child: GridView.count(
                    crossAxisCount: 7,
                    mainAxisSpacing: 7.0,
                    crossAxisSpacing: 7.0,
                    padding: const EdgeInsets.all(10.0),
                    children: alphabets.map((e) {
                      return RawMaterialButton(
                        onPressed: selectedChar.contains(e)
                            ? null
                            : () {
                                setState(() {
                                  selectedChar.add(e);
                                  if (!wordSelected
                                      .split('')
                                      .contains(e.toUpperCase())) {
                                    tries++;
                                    if (tries >= 7) {
                                      isGameOver = true;
                                    }
                                  }
                                });
                              },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Text(
                          e,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        fillColor: selectedChar.contains(e)
                            ? Colors.black87
                            : Colors.blue,
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
    );
  }
}
