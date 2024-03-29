import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection {
  Future<Database> setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'scores_database.db');
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
    return database;
  }

  Future<void> _createDatabase(Database database, int version) async {
    String sql = "CREATE TABLE scores (id INTEGER PRIMARY KEY AUTOINCREMENT,date TEXT,score TEXT);";
    await database.execute(sql);
  }
}
