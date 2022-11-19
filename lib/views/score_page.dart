import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hangman/services/score_service.dart';
import '../language/langlist.dart';
import '../language/language.dart';
import '../models/score_model.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({super.key});

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  Language? selectedLang;
  List<ScoreModel> scoreList = [];
  final scoreService = ScoreService();
  bool isLoading = true;
  int totalScore = 0;

  getAllScores() async {
    scoreList = [];
    var scores = await scoreService.readAllScores();
    scores.forEach((score) {
      setState(() {
        var scoreModel = ScoreModel();
        scoreModel.id = score['id'];
        scoreModel.date = score['date'];
        scoreModel.score = int.parse(score['score']);
        totalScore = totalScore + int.parse(score['score']);
        scoreList.add(scoreModel);
      });
    });
    scoreList = scoreList.reversed.toList();
  }

  deleteScore(BuildContext context, id) async {
    scoreService.deleteScore(id);
    setState(() {
      getAllScores();
    });
  }

  @override
  void initState() {
    super.initState();
    getAllScores();
  }

  @override
  Widget build(BuildContext context) {
    selectedLang = languageList.singleWhere((e) => e.locale == context.locale);
    return Scaffold(
      appBar: AppBar(
        title: Text('${'total_score'.tr()} : ${totalScore.toString()}'),
      ),
      body: ListView.builder(
        itemCount: scoreList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(5),
            child: ListTile(
              leading: Text(
                '${'score'.tr()} : ${scoreList[index].score}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              trailing: Text(scoreList[index].date?.substring(0, 19) ?? ''),
            ),
          );
        },
      ),
    );
  }
}
