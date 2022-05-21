import 'dart:io';
import 'dart:async';
import 'package:ilaz/models/UserListModel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseHelper {
  static const String tableName = "ilaz";
  static const String columnId = "id";
  static const String columnName = "name";
  static const String columnUserName = "username";
  static const String columnEmail = "email";
  static const String columnImage = "profile_image";
  static const String columnStreet = "street";
  static const String columnSuite = "suite";
  static const String columnCity = "city";
  static const String columnZipCode = "zipcode";
  static const String columnLat = "lat";
  static const String columnLng = "lng";
  static const String companyAddress = "address";
  static const String website = "website";

  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;
  static Database? _db;

  Future<Database> get getDb async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "ilaz.db");
    var dbCreated = await openDatabase(path, version: 1, onCreate: _onCreate);
    return dbCreated;
  }

  void _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $tableName("
        "$columnId INTEGER PRIMARY KEY, "
        "$columnName TEXT, "
        "$columnUserName TEXT, "
        "$columnEmail TEXT, "
        "$columnImage TEXT, "
        "$columnStreet TEXT, "
        "$columnSuite TEXT, "
        "$columnCity TEXT, "
        "$columnZipCode TEXT,"
        "$website TEXT"
        ");");
  }

  Future<int> saveItem(UserListModel item) async {
    var dbClient = await getDb;
    int rowsSaved = await dbClient.insert(tableName, item.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return rowsSaved;
  }

  Future<List<UserListModel>> getAllEmployees() async {
    final db = await getDb;
    final res = await db.rawQuery("SELECT * FROM $tableName");
    List<UserListModel> list = res.isNotEmpty
        ? res.map((c) => UserListModel.fromJson(c)).toList()
        : [];
    return list;
  }

  Future close() async {
    var dbClient = await getDb;
    dbClient.close();
  }
}
