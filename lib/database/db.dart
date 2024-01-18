import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DB {

  DB._();
  static final DB instance = DB._();

  static Database? _database;

  get database async {
    if(_database != null) return _database;

  return await _initialDatabase();

  
    
  }
  
  _initialDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'task.db'),

      version: 1,

      onCreate: _onCreate,
    );
  }

  _onCreate(db, versao) async {
    await db.execute(_dailytask);
    await db.execute(_studies);
    await db.execute(_payments);
    await db.execute(_commitment);
    await db.execute(_shopping);

  }

  String get _dailytask => '''
  CREATE TABLE dailytask (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT,
    description TEXT,
    status TEXT
  );
''';

String get _studies => '''
CREATE TABLE studies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  matter TEXT,
  subject TEXT,
  );
''';

String get _payments => '''
CREATE TABLE payments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  description TEXT,
  date TEXT,
  value TEXT,
);
''';

String get _commitment =>'''

CREATE TABLE commitment (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  description TEXT,
  date TEXT,
  time TEXT,
);
''';

String get _shopping =>'''
  CREATE TABLE shopping (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    description TEXT,
    
  );
''';
}
