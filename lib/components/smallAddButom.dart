import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';


class AddButom extends StatelessWidget {
  
  
  AddButom();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0, bottom: 8.0 ),
      child: GestureDetector(
        onTap: ()=> showFlexibleBottomSheet(
          bottomSheetBorderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
  minHeight: 0,
  initHeight: 0.8,
  maxHeight: 0.8,
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
              
          ),
        ),
      );
  }

  
),


        
        child: Container(
          child: Center(
            child: Text('Add',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white
            )
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue
          ),
        ),
      ),
    );
  }
}