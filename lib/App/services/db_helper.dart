import 'package:calenderapp/App/Screens/models/event_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = 'my_database';

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'my_database.db';
      _db = await openDatabase(_path, version: _version, onCreate: (db, v) {
        print("Create new one");
        return db.execute(
          "CREATE TABLE $_tableName("
          "id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "eventName STRING, description TEXT, date INTEGER, color STRING, "
          "startTime INTEGER, endTime INTEGER, "
          "repeat INTEGER, "
          "category STRING, "
          "isCompleted INTEGER)",
        );
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(EventModel event) async {
    return await _db?.insert(_tableName, event.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> queryData() async {
    return _db!.query(_tableName);
  }

  static Future deleteAll() async {
    return await _db!.rawDelete("DELETE * FROM $_tableName");
  }

  static Future deleteSpecificData({required int id}) async {
    return await _db!.delete(_tableName, where: "id=?", whereArgs: [id]);
  }
}
