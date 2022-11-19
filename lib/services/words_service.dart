import 'dart:math';
import 'package:flutter/services.dart';

class WordService {
  int wordCounter = 0;
  int randNumber = 0;
  bool notUnique = true;
  List<int> usedNumbers = [];
  List<String> _words = [];

  Future readWordsEn() async {
    String fileText = await rootBundle.loadString('assets/res/words_en.txt');
    _words = fileText.split('\n');
  }

  Future readWordsTr() async {
    String fileText = await rootBundle.loadString('assets/res/words_tr.txt');
    _words = fileText.split('\n');
  }

  String? getWord() {
    wordCounter += 1;
    var rand = Random();
    randNumber = rand.nextInt(_words.length);
    notUnique = true;
    if (wordCounter - 1 == _words.length) {
      notUnique = false;
      return '';
    }
    while (notUnique) {
      if (!usedNumbers.contains(randNumber)) {
        notUnique = false;
        usedNumbers.add(randNumber);
        return _words[randNumber];
      } else {
        randNumber = rand.nextInt(_words.length);
      }
    }
    return _words[randNumber];
  }

  void resetWord() {
    wordCounter = 0;
    usedNumbers = [];
    _words = [];
  }
}
