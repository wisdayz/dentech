import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//manajemen database SQLite di dalam aplikasi
class DbHelper {
  static Database? _database;
  static final DbHelper instance = DbHelper._privateConstructor();

  DbHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'reservasi_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE reservasi (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT,
        alamat TEXT,
        tanggal TEXT,
        jam TEXT
      )
    ''');
  }
}
