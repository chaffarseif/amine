import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class tachedb {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDB();
      return _db;
    } else {
      return _db;
    }
  }

  intialDB() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'amine.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE "tache"(id INTEGER AUTOINCREMENT NOT NULL PRIMARY KEY, title TEXT , isComplited BOOLEAN)');
    print("create");
  }

  _onUpgrade(Database db, int oldversion, int newversion) {}
  affiche(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insert(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(
        "INSERT INTO tache (title , iscomplited) values (?,?)", ['sql', false]);
    print(response);
    return response;
  }

  update(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(
        "UPDATE tache SET title = ?, value = ? iscomplited = ?",
        ['sql', false]);
    return response;
  }

  delete(String sql) async {
    Database? mydb = await db;
    int response =
        await mydb!.rawDelete("DELETE FROM tache WHERE name = ?", ['sql']);
    return response;
  }
}
