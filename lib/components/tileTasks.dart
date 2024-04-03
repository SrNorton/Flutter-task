


import 'package:daily_task/components/statusTask.dart';
import 'package:daily_task/database/dbRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dismissible_tile/flutter_dismissible_tile.dart';
import 'package:provider/provider.dart';

class TileTask extends StatelessWidget {

  
   String? image;
   String? task;
   int? id;
   String? tilebool;
  TileTask({required this.image, required this.task, this.id, this.tilebool});
  
  
  @override
  Widget build(BuildContext context) {
  var data = context.read<DbRepository>();


  void delete(){
    data.deleteData(id: id);
    data.readallData();
  }

    return 
    // DismissibleTile(
    //   key: UniqueKey(),
    //   onDismissConfirmed: delete,
    //   rtlDismissedColor: Colors.redAccent,
    //   rtlOverlay: const Text('Delete', 
    //    style:TextStyle(
    //                       color: Colors.white,
    //                       fontSize: 25,
    //                       fontWeight: FontWeight.w800,
    //                       fontFamily: "TitilliumWeb",
    //                     ),
    //   ),
    //   rtlOverlayDismissed: const Text('Deleted',
    //    style:TextStyle(
    //                       color: Colors.white,
    //                       fontSize: 25,
    //                       fontWeight: FontWeight.w800,
    //                       fontFamily: "TitilliumWeb",
    //                     ),),
    //   child: 
    Card(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Row(
            children: [
             
              Container(
                height: 60,
                width: 60,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(image!),
                ),
              ),
              Expanded(
                child: 
                Container(
                  child: Text(task!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),),
                StatusTask(idtask: id, bool: tilebool!,),
      
            ],),
        ),
      
      );
    // );
  }
}