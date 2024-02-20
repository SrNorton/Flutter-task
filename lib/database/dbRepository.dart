import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_app/database/db.dart';
import 'package:task_app/models/meeting.dart';
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

  List<Meeting> listMeetingDb = [];


  //transformar compromissos calendário
  List<Meeting> loadDates(List data){
    

     List<Meeting> listCalendarCommitment =  data.map((e) {
        return Meeting.fromData(
          eventName: e['description'],
          year: DateTime.parse(e['date']).year,
          month: DateTime.parse(e['date']).month,
          day: DateTime.parse(e['date']).day,
          hours: e['hours'],
          minutes: e['minutes'],
          background: Color.fromARGB(e['colorA'], e['colorR'], e['colorG'], e['colorB']),
          isAllDay: false,
        );
      }).toList();
      
      listMeetingDb = listCalendarCommitment;
    print(listMeetingDb[0].eventName);

      notifyListeners();
      return listCalendarCommitment;


    }





  //salvar compromissos calendário
  Future setCommitiment({description, date, hours, minutes, colorA, colorR, colorG, colorB}) async {
    
    final db = await DB.instance.database;

    await db.insert('commitment', {
      'description': description,
      'date': date,
      'hours': hours,
      'minutes': minutes,
      'colorA': colorA,
      'colorR': colorR,
      'colorG': colorG,
      'colorB': colorB,
    });

    notifyListeners();

    print('$description adicionado aos compromissos, as $hours horas e $minutes, do dia $date');
  }


  List listTileBuilder = [];
   
  

  List listCommitment = [];
  

  
  
 

  Future readCommitment() async {
    final db = await DB.instance.database;
    final allCommitment = await db.query('commitment');
    listCommitment = allCommitment;
    await loadDates(listCommitment);
    
    notifyListeners();
    print(listCommitment);
    return;
  }
  

  



  Future readallData() async {
    final db = await DB.instance.database;
    final alldata = await db.query('dailytask');
    listTileBuilder = alldata;
    
    
    notifyListeners();
    
    print(listTileBuilder);
    
    
    return;

  }

  

  Future deleteData() async {
    final db = await DB.instance.database;
    final clear = await db.delete('dailytask');
    notifyListeners();
    return;
  }

  Future updateData({status, id})async {
    final db = await DB.instance.database;
    int dbupadateId = await db.rawUpdate(
      'UPDATE dailytask SET status= ? WHERE id=?', [status, id]
    );
    notifyListeners();
    print('id da task atualizada $dbupadateId');
    return;
  }


}