import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_app/database/db.dart';
import 'package:task_app/models/tile.dart';

class DbRepository extends ChangeNotifier {
  late Database db;

  List<Tile>  dailyTasklist =[];

Future  setDailyTask(Tile daily) async {
    db = await DB.instance.database;

    dynamic setDay = await  db.insert('dailytask', {
      'tipe': daily.image,
      'description': daily.descriptionTask,
      'status': daily.status.toString()
    });

    dailyTasklist = setDay;
    print(dailyTasklist);

    notifyListeners();
    
  }
  
  
}