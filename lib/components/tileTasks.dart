






import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/components/statusTask.dart';
import 'package:task_app/database/dbRepository.dart';

class TileTask extends StatefulWidget {

  
  final  String? image;
  final  String? task;
  final  int? id;
  final  String? tilebool;
  
  TileTask({required this.image, required this.task, this.id, this.tilebool,});

  @override
  State<TileTask> createState() => _TileTaskState();
}

class _TileTaskState extends State<TileTask> {


 


  @override
  Widget build(BuildContext context) {
  var data = context.read<DbRepository>();


  void delete(context){
    data.deleteData(id: widget.id);
    data.readallData();
    
  }

   Future<bool> _confirmDismiss() async {
  return await showDialog(
    context: context,
    
    builder: (context) => AlertDialog(
      
      title: Text('Confirmar'),
      content: Text('Deseja realmente dispensar este item?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
            delete(context);
          } ,
          child: Text('Confirmar'),
          
          
        ),
      ],
    ),
  );
}



 

    return 
    
    Slidable(
      key:  ValueKey(widget.id),

      startActionPane: ActionPane(
        motion: const ScrollMotion(),
         dismissible: DismissiblePane(
          onDismissed: (){
        
          delete(context);   
           setState(() {
            
           
         });
            
          },
        confirmDismiss: _confirmDismiss,
          resizeDuration: Durations.extralong4,
          ),
       children:  [
         SlidableAction(
                    onPressed: delete,
                   
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
       ],
       
       ),
      child: Card(
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
                    child: Image.asset(widget.image!),
                  ),
                ),
                Expanded(
                  child: 
                  Container(
                    child: Text(widget.task!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  ),),
                  StatusTask(idtask: widget.id, bool: widget.tilebool!,),
        
              ],),
          ),
        
        ),
    );
    
  }
}