import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_app/database/db.dart';
import 'package:task_app/models/tile.dart';

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

  List listTileBuilder = [];

  // void setDatalist () {
  //   listTileBuilder.add(_wholeDataList.map((e) => Tile.fromMap(e)).toList());
    
  // }

  // List<Map<String, dynamic>> _wholeDataList = [];




  Future readallData() async {
    final db = await DB.instance.database;
    final alldata = await db.query('dailytask');
    listTileBuilder = alldata;
    
    notifyListeners();
    print(alldata);
    print(listTileBuilder);
    return;

  }

  Future deleteData() async {
    final db = await DB.instance.database;
    final clear = await db.delete('dailytask');
    notifyListeners();

  }

  Future updateData({status, id})async {
    final db = await DB.instance.database;
    int dbupadateId = await db.rawUpdate(
      'UPDATE dailytask SET status= ? WHERE id=?', [status, id]
    );
    notifyListeners();
    print('id da task atualizada $id');
  }


}