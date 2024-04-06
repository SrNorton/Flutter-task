


import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:task_app/components/statusShoppingList.dart';
import 'package:task_app/database/dbRepository.dart';

class TileShoppingList extends StatefulWidget {
   
  final String? item;
 final  int? id;
  final String? tilebool;
  
  TileShoppingList({required this.item, this.id, this.tilebool});

  @override
  State<TileShoppingList> createState() => _TileShoppingListState();
}

class _TileShoppingListState extends State<TileShoppingList> {
  @override
  Widget build(BuildContext context) {
   

 var data = context.read<DbRepository>();


  void delete(context){
   
    data.deleteItemShopping(id: widget.id);
    data.readListShopping();
    
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
              child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 6),
      child: Row(
        children: [
         
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            ),
            height: 60,
            width: 60,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset('assets/images/shoppingbasket.png',
             
              ),
            ),
          ),
          Expanded(
            child: 
            Container(
              child: Text(widget.item!,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              ),
            ),),
          StatusShoppingList(idItem: widget.id, bool: widget.tilebool, ),
            
        ],),
              ),
            
            ),
    );
  }
}