import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../language/langlist.dart';
import '../language/language.dart';
import '../services/words_service.dart';
import 'play_game_page.dart';
import 'score_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  final WordService hangmanWords = WordService();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Language? selectedLang;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    selectedLang = languageList.singleWhere((e) => e.locale == context.locale);
    if (selectedLang!.langName == 'English - US') {
      widget.hangmanWords.readWordsEn();
    } else if (selectedLang!.langName == 'Türkçe - TR') {
      widget.hangmanWords.readWordsTr();
    }
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              DropdownButton<Language>(
                value: selectedLang,
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  padding: const EdgeInsets.only(left: 4, right: 4),
                  color: Colors.transparent,
                ),
                onChanged: (newValue) {
                  setState(() {
                    selectedLang = newValue!;
                  });
                  if (newValue!.langName == 'English - US') {
                    context.setLocale(const Locale('en'));
                  } else if (newValue.langName == 'Türkçe - TR') {
                    context.setLocale(const Locale('tr'));
                  }
                  WordService().resetWord();
                },
                items: languageList.map<DropdownMenuItem<Language>>((Language value) {
                  return DropdownMenuItem<Language>(
                    value: value,
                    child: Text(
                      value.langName!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const Text(
                'HANGMAN',
                style: TextStyle(color: Colors.white, fontSize: 58.0, letterSpacing: 3.0),
              ),
              Image.asset(
                'images/gallow.png',
                height: height * 0.4,
              ),
              const SizedBox(height: 5.0),
              ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                ),
                child: Text(
                  'start'.tr(),
                  style: const TextStyle(fontSize: 26),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlayGamePage(
                        hangmanObject: widget.hangmanWords,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 5.0),
              ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                ),
                child: Text(
                  'scores'.tr(),
                  style: const TextStyle(fontSize: 26),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScorePage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
