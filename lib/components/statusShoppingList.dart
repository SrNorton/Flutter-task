

import 'package:daily_task/database/dbRepository.dart';
import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:provider/provider.dart';

class StatusShoppingList extends StatefulWidget {
  final int? idItem;
  final String? bool;
  StatusShoppingList({required this.idItem, this.bool});

  @override
  State<StatusShoppingList> createState() => _StatusShoppingListState();
}

class _StatusShoppingListState extends State<StatusShoppingList> {

  bool? isChecked = false;


  
  @override
  Widget build(BuildContext context) {
    
    var data = context.read<DbRepository>();

  isChecked = widget.bool == 'true' ? true : false;
  

  Future upDate({String? change}) async{
         await data.updateListShopping(status: change, id: widget.idItem);
         

  }


  
    return Center(
      child: MSHCheckbox(
        size: 45,
        value: isChecked!,
        colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
          checkedColor: Colors.green,
        ),
        style: MSHCheckboxStyle.fillScaleColor,
       
        onChanged: (bool selected) {
          upDate(change: selected  ? 'true' : 'false');
          setState(() {
           
            isChecked = selected;
            print('apertei');
          
            data.readListShopping();

          });

        },
      ),
    );
  }
}