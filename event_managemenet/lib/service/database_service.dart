import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  DatabaseService._(this.database);

  Database? database;

  Future<Database?> checkDb() async {
    if (database != null) {
      return database!;
    } else {
      return await createDb();
    }
  }

  Future<Database?> createDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    Database database1 = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute('CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT)');
    });
    return database1;
  }

  Future<void> insertData() async {
    database = await checkDb();
    final value = {
      "id": 1,
      "name": "hp",
    };
    final result = await database?.insert("test", value);
  }
}
