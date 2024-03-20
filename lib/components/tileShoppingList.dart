import 'package:flutter/material.dart';
import 'package:flutter_dismissible_tile/flutter_dismissible_tile.dart';
import 'package:provider/provider.dart';
import 'package:task_app/components/statusShoppingList.dart';
import 'package:task_app/database/dbRepository.dart';

class TileShoppingList extends StatelessWidget {
   
   String? item;
   int? id;
   String? tilebool;
  
  TileShoppingList({required this.item, this.id, this.tilebool});

  @override
  Widget build(BuildContext context) {

 var data = context.read<DbRepository>();


  void delete(){
    data.deleteItemShopping(id: id);
    data.readListShopping();
  }



    return 
    DismissibleTile(
       key: UniqueKey(),
      onDismissConfirmed: delete,
      rtlDismissedColor: Colors.redAccent,
      rtlOverlay: const Text('Delete', 
       style:TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          fontFamily: "TitilliumWeb",
                        ),
      ),
      rtlOverlayDismissed: const Text('Deleted',
       style:TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          fontFamily: "TitilliumWeb",
                        ),),
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
              child: Text(item!,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              ),
            ),),
          StatusShoppingList(idItem: id, bool: tilebool!,),
            
        ],),
              ),
            
            ),
    );
  }
}