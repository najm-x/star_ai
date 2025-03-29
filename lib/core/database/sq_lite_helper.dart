import 'package:business_tools/core/database/sql_keys.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//tables

class SQLiteHelper {
  static Database? _database;
  Future<Database> get db async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbname = "star.db";
    final path = join(await getDatabasesPath(), dbname);
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE ${SqliteKeys.summary.summaryTable} (id INTEGER PRIMARY KEY  AUTOINCREMENT, ${SqliteKeys.summary.vdUrlColumn} TXT , ${SqliteKeys.summary.vdTitleColumn} TEXT , ${SqliteKeys.summary.vdLangColumn} TXT , ${SqliteKeys.summary.summaryContentColumn} TXT)');
      },
    );
  }

  Future<void> insert(String table, Map<String, Object?> data) async {
    Database database = await db;
    await database.insert(table, data);
  }

  Future<void> update(String table, String where, List<Object?>? whereArgs, Map<String, Object?> data) async {
    Database database = await db;
    await database.update(table, data, where: where, whereArgs: whereArgs);
  }

  Future<void> delete(String table, String where, List<Object?>? whereArgs) async {
    Database database = await db;
    await database.delete(table, where: where, whereArgs: whereArgs);
  }

  Future<List<Map<String, Object?>>> getQuery(String table, String where, List<Object?>? whereArgs) async {
    Database database = await db;
    return await database.query(table, where: where, whereArgs: whereArgs);
  }
}
