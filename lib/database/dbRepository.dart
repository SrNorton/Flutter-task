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

  Future setCommitiment({description, date, hours, minutes}) async {
    final db = await DB.instance.database;

    await db.insert('commitment', {
      'description' : description,
      'date' : date,
      'hours' : hours,
      'minutes' : minutes,
    });

    notifyListeners();

    print('$description adicionado aos compromissos');
  }


  List listTileBuilder = [];
   
  

  

  
  
  
  // Future filterData(List<dynamic> list) async {
  //      var filtroAzul = await list.where((e) => e['type'] == 'assets/images/ellipseblue.png' && e['status'] == 'false').toList();
  //   // var listYellowDone = list.where((e) => e['type'] == 'assets/images/ellipsyellow.png' && ['status'] == 'true').toList();
  //   // var listYellowInProgress = list.where((e) => e['type'] == 'assets/images/ellipsyellow.png' && ['status'] == 'false').toList();
  //   // var listPerppleInProgress = list.where((e) => e['type'] == 'assets/images/ellipsperpple.png' && ['status'] == 'false').toList();
  //   // var listPerppleInDone = list.where((e) => e['type'] == 'assets/images/ellipsperpple.png' && ['status'] == 'true').toList();
  //   // var listGreenDone = list.where((e) => e['type'] == 'assets/images/ellipsgreen.png' && ['status'] == 'true').toList();
  //   // var listGreenInProgress = list.where((e) => e['type'] == 'assets/images/ellipsgreen.png' && ['status'] == 'false').toList();
  //   notifyListeners();
  //   print('lista azul filtrada $filtroAzul');
  //   return;
  // }
  

  



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
    print('id da task atualizada $dbupadateId');
  }


}