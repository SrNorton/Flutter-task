import 'package:flutter/material.dart';

class ButomSaveTask extends StatefulWidget {
  
  
  ButomSaveTask({
    required this.index,
    
    
  });

  final int? index;
  

  @override
  State<ButomSaveTask> createState() => _ButomSaveTaskState();
}

class _ButomSaveTaskState extends State<ButomSaveTask> {
  @override
  Widget build(BuildContext context) {

    Color? color;

      

      switch (widget.index) {
      case  0:
     color = Colors.blue;
        
        break;
        case 1:
       color = Colors.yellow;
       break;
        case 2:
        
       color = Colors.purple;
       break;
        case 3:
       color = Colors.green;
       break;
      default:
      color =Colors.black;
    }
    
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width - 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color,
        
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
    );
  }
}

