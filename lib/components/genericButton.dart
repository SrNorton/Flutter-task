import 'package:flutter/material.dart';

class GenericButton extends StatelessWidget {
  
  final String title;
  final IconData? icon;
  final VoidCallback function;
  final Color? color;
  
  GenericButton({
    required this.title,  this.icon, required this.function, this.color
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
       height: 55,
       width: 300,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(20),
         color: color == null ? Colors.orange[300] : color,
       ),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [ 
           Text(title,
           style: TextStyle(
           color: Colors.white,
           fontSize: 25,
           fontWeight: FontWeight.w800,
           fontFamily: "TitilliumWeb",
         ),
           ), 
           SizedBox(width: 10,),
           Icon(icon),
         ],
       ),
      ),
    );
  }
}

