import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/manager/timeManager.dart';

class EditMinutes extends StatefulWidget {
  
  EditMinutes(
   
  );
  

  @override
  State<EditMinutes> createState() => _EditMinutesState();
}

class _EditMinutesState extends State<EditMinutes> {
  // int _iniMin = 30;

  // removeMinutes(){
  //   _iniMin --;
  //   setState(() {
      
  //   });
  //   notifyListeners();
    
  // }

  // addMinutes(){
  //   _iniMin ++;
  //   setState(() {
      
  //   });
  //   notifyListeners();
  // }

  

  @override
  Widget build(BuildContext context) {

    var _iniMin = context.watch<TimeProvider>().minutes;


    return Row(
      children: [
        _iniMin > 0 ? 
        IconButton(onPressed: (){
          context.read<TimeProvider>().removeMinutes();
        }, icon: Icon(Icons.remove_circle)) : Container(),
    
        Center(child: Text(_iniMin.toString() + '   '+'Min')),
        _iniMin < 60 ?
        IconButton(onPressed: (){
          context.read<TimeProvider>().addMinutes();
        }, icon: Icon(Icons.add_circle)) : Container()
    
      ],
    );
  }
}