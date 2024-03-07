import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_app/models/tile.dart';





class DB {
//  Database? _database;  
 

  DB._();
  static final DB instance = DB._();

  static Database? _database;

   get database async {
    if(_database != null) return _database;
      return await _initializeDB('task.db');
  

  
    
  }
  
 
  _initializeDB(String filepath) async {
    final dbpath = await getDatabasesPath();

    final path = join(dbpath, filepath);


    return await openDatabase(path, version: 1,
    
    onCreate: _createDB
    
     );

      
    
  }

  Future _createDB(Database db, int version) async {
    
    await db.execute(_studies);
    await db.execute(_commitment);
    await db.execute(_dailytask);
    await db.execute(_payments);
   
    await db.execute(_shopping);

  
  }

  

  String get _dailytask => '''
  CREATE TABLE dailytask(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT,
    description TEXT,
    status TEXT
  );
''';

String get _studies => '''
CREATE TABLE studies(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  matter TEXT,
  subject TEXT
  );
''';



String get _payments => '''
CREATE TABLE payments(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  description TEXT,
  date TEXT,
  value TEXT
);
''';

String get _commitment =>'''

CREATE TABLE commitment(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  description TEXT,
  date TEXT,
  hours INT,
  minutes INT,
  colorA INT,
  colorR INT,
  colorG INT,
  colorB INT
);
''';

String get _shopping =>'''
  CREATE TABLE shopping(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    item TEXT,
    status TEXT
  );
''';



// Future  setDailyTask({String? category, description, status}) async {
    

 
//   final db = await database;

    
//   await db.insert('dailytask', {
//       'type': category,
//       'description': description,
//       'status': status,
      
//     });

//     print('$description adicionado');
    
    

    
    
//   }

//   List wholeDataList = [];

//   Future readallData() async {
//     final db = await database;
//     final alldata = await db.query('dailytask');
//     wholeDataList = alldata;
//     print(wholeDataList);

//   }
}
