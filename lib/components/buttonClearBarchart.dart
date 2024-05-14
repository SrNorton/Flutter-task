import 'package:flutter/material.dart';

class ButtonClearBarChart extends StatelessWidget {
  
  final VoidCallback function;
  const ButtonClearBarChart({
    required this.function,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
       height: 25,
       width: 100,
       child: Center(
         child: Text('Clear',
         style:TextStyle(
           color: Colors.white,
         )
         ),
       ),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(20),
         color: Colors.blue,
       )
       
      ),
    );
  }
}