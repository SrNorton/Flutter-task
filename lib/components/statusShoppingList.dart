import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

class StatusShoppingList extends StatefulWidget {
  final int? idItem;
  final String? bool;
  StatusShoppingList({required this.idItem, required this.bool});

  @override
  State<StatusShoppingList> createState() => _StatusShoppingListState();
}

class _StatusShoppingListState extends State<StatusShoppingList> {

  bool isChecked = false;


  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MSHCheckbox(
        size: 45,
        value: isChecked,
        colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
          checkedColor: Colors.green,
        ),
        style: MSHCheckboxStyle.fillScaleColor,
        onChanged: (selected) {
          
          setState(() {
           
            isChecked = selected;
          


          });

        },
      ),
    );;
  }
}