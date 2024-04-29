


import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_app/database/db.dart';
import 'package:task_app/models/meeting.dart';

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

  Future setShoppingList({item, status}) async {
    final db = await DB.instance.database;

    await db.insert('shopping', {
      'item': item,
      'status': status,
    });
    notifyListeners();


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



  Future setStudyTime({time, weekday})async{
    final db = await DB.instance.database;

    await db.insert('studies', {
      'time': time,
      'weekday': weekday
    });
    
    print('$time minutos adicionados ao dia $weekday');
    notifyListeners();
  }

  Future setProfile({name, image}) async {
    final db = await DB.instance.database;

     await db.insert('profile', {
      'name' : name,
      'image' : image
    });
    
    notifyListeners();
    return;
  }


  //Lists

  List listTimeStudy = [];

  List listProfile = [];


  List listTileBuilder = [];
   
  

  List listCommitment = [];
  
  List listShopping = [];


  //read
  Future readStudydata () async {
    final db = await DB.instance.database;
    final allStudydata = await db.query('studies');
    listTimeStudy = allStudydata;
    notifyListeners();
    return;
  }

  Future readProfile() async {
    final db = await DB.instance.database;

    final profile = await db.query('profile');
    listProfile = profile;
    print('este é o profile $listProfile');
    notifyListeners();
  }
 

  Future readCommitment() async {
    final db = await DB.instance.database;
    final allCommitment = await db.query('commitment');
    listCommitment = allCommitment;
    await loadDates(listCommitment);
    
    notifyListeners();
    print(listCommitment);
    return;
  }
  

  
  Future readListShopping()async {
    final db = await DB.instance.database;
    final allShopping = await db.query('shopping');
    listShopping = allShopping;
    notifyListeners();
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


  //delete
  Future deleteItemShopping({id}) async {
    final db = await DB.instance.database;
     await db.delete('shopping', where: 'id=?', whereArgs: [id] );
    notifyListeners();
    return;
  }

  Future deleteProfile() async {
    final db = await DB.instance.database;
    await db.delete('profile');
    notifyListeners();
    return;
  }

  

  Future deleteData({id}) async {
    final db = await DB.instance.database;
     await db.delete('dailytask', where: 'id=?', whereArgs: [id]);
    notifyListeners();
    print('id da task deletado $id');
    return;
  }

  Future deleteStudieDb() async {
    final db = await DB.instance.database;
    await db.delete('studies');
    notifyListeners();
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

  
  //update shopping list 
  Future updateListShopping({status, id}) async {
    final db = await DB.instance.database;
    int updateList = await db.rawUpdate(
      'UPDATE shopping SET status= ? WHERE id=?', [status, id]
    );
    notifyListeners();
    print('id do item atualizado $id');
    return;
  }


}