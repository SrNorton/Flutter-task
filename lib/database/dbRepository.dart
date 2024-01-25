import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_app/database/db.dart';

class DbRepository extends ChangeNotifier {
  late Database db;
 
 
 
 
  Future  setDailyTask({String? category, description, status}) async {
    

 
      final db = await DB.instance.database;


    
  await db.insert('dailytask', {
      'type': category,
      'description': description,
      'status': status,
      
    });
    notifyListeners();

    print('$description adicionado');
    
    

    
    
  }

  List wholeDataList = [];

  Future readallData() async {
    final db = await DB.instance.database;
    final alldata = await db.query('dailytask');
    wholeDataList = alldata;
    notifyListeners();
    print(wholeDataList);

  }


}