import 'package:hangman/db_helper/repository.dart';
import '../models/score_model.dart';

class ScoreService {
  final Repository _repository = Repository();

  saveScore(ScoreModel score) async {
    return await _repository.insertData('scores', score.toMap());
  }

  readAllScores() async {
    return await _repository.readData('scores');
  }

  updateScores(ScoreModel score) async {
    return await _repository.updateData('scores', score.toMap());
  }

  deleteScore(scoreId) async {
    return await _repository.deleteDataById('scores', scoreId);
  }
}
