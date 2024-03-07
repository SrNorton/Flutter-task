import 'package:flutter/material.dart';
import 'package:task_app/components/statusShoppingList.dart';

class TileShoppingList extends StatelessWidget {
   
   String? item;
   int? id;
   String? tilebool = '';
  
  TileShoppingList({required this.item, this.id, this.tilebool});

  @override
  Widget build(BuildContext context) {
    return Card(
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
            child: Text(item!,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            ),
          ),),
        StatusShoppingList(idItem: id, bool: tilebool,),
          
      ],),
            ),
          
          );
  }
}