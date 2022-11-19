class ScoreModel {
  int? id;
  String? date;
  int? score;

  ScoreModel({this.id, this.date, this.score});

  toMap() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['date'] = date;
    map['score'] = score;
    return map;
  }

  ScoreModel.fromMap(Map map) {
    id = map[id];
    date = map[date];
    score = map[score];
  }
}
