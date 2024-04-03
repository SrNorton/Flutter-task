

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:daily_task/components/textFormShoppingList.dart';
import 'package:daily_task/components/tileShoppingList.dart';
import 'package:daily_task/constants/constants.dart';
import 'package:daily_task/database/dbRepository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {





  @override
  Widget build(BuildContext context) {

         context.read<DbRepository>().readListShopping();







    return Scaffold(
      backgroundColor: Kbackground,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        title:  Text(
                      "Lista de Compras",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      fontFamily: "TitilliumWeb",
                    ),
                    
                    ),
      ),
      body: 
      Column(
        children: [
          Expanded(
            child: Container(
                
                width: MediaQuery.of(context).size.width,
                color: Kbackground,
                child: Consumer<DbRepository>(
                  
                  builder: (BuildContext ctx, dbrepository,__){
                   
                  
                    
                   
                      
                    
                    return ListView.builder(
                      
                      itemCount: dbrepository.listShopping.length,
                      itemBuilder: (BuildContext ctx, int index){
            
                        return 
                        
                        //  Container(
                        //   height: 200,
                        //   width: 300,
                        //   child: Row(
                        //     children: [
                        //       Center(child: StatusShoppingList(idItem: 1, ))
                        //     ],),
                        // );
                        
                        TileShoppingList(
                          id: dbrepository.listShopping[index]['id'],
                           item: dbrepository.listShopping[index]['item'],
                          tilebool: dbrepository.listShopping[index]['status'],
                          );
                      
                        
                      }
                      
                      );
                      
                  }
                  
                ),
              ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: ()=> showFlexibleBottomSheet(
          bottomSheetBorderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
  minHeight: 0,
  initHeight: 0.6,
  maxHeight: 0.6,
  context: context,
  builder: (
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return Material(
        child: Container(
          
          child: ListView(
              controller: scrollController,
              shrinkWrap: true,
              children: [
                TextFormShoppingList(),
                

              ],
              
          ),
        ),
      );
  }

  
),
),
    );
  }
}

