import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:task_app/database/dbRepository.dart';

class TileCommitment extends StatefulWidget {
  
 final String commitment;
  final String date;
  const TileCommitment({ required this.commitment, required this.date, super.key});

  @override
  State<TileCommitment> createState() => _TileCommitmentState();
}

class _TileCommitmentState extends State<TileCommitment> {
  @override
  Widget build(BuildContext context) {

  
  
  
  
  var data = context.read<DbRepository>();


  void delete(context){
      data.deleCommitment();
      data.readCommitment();
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


    return  Slidable(
      key:  const ValueKey(1),

      startActionPane: ActionPane(
        motion: const ScrollMotion(),
         dismissible: DismissiblePane(
          onDismissed: (){
            
            delete(context);
           
            
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




   
      child:
    
    Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      color: Colors.blue,
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            child: Icon(Icons.calendar_month_outlined),
          ),
          Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
              Text(
                widget.commitment,
                 style: TextStyle(
                  color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
              ),
          
              Text(widget.date)
            ],
          ),
        ],
      ),
    ),
    );
  }
}