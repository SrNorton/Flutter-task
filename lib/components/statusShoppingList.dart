import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:provider/provider.dart';
import 'package:task_app/database/dbRepository.dart';

class StatusShoppingList extends StatefulWidget {
  final int? idItem;
  final String? bool;
  StatusShoppingList({required this.idItem, required this.bool});

  @override
  State<StatusShoppingList> createState() => _StatusShoppingListState();
}

class _StatusShoppingListState extends State<StatusShoppingList> {

  bool? isChecked;


  
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
       
        onChanged: (selected) {
          upDate(change: selected  ? 'true' : 'false');
          setState(() {
           
            isChecked = selected;
          
            data.readListShopping();

          });

        },
      ),
    );
  }
}