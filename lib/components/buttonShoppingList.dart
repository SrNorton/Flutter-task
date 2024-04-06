import 'package:flutter/material.dart';

class ButtonShoppingList extends StatelessWidget {
  

  final VoidCallback function;
  
  ButtonShoppingList({
    required this.function
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width - 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blue,
              
            ),
            child: Center(
              child: Text('Salvar',
              
              style: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
              fontFamily: "TitilliumWeb",
              color: Colors.white
      
              ),
              ),
            ),
          ),
    );
  }
}