

import 'package:daily_task/manager/timeManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditHours extends StatefulWidget  {
 
  EditHours(
  );

  @override
  State<EditHours> createState() => _EditHoursState();
}

class _EditHoursState extends State<EditHours> {
  

  // removeHours(){
  //   _initHours --;
  //   setState(() {
      
  //   });
  //   notifyListeners();
  //   print('valor das horas $_initHours');
  // }

  // addHours(){
  //   _initHours ++;
  //   setState(() {
      
  //   });
  //   notifyListeners();
  // }
  @override
  Widget build(BuildContext context) {

    var _initHours = context.watch<TimeProvider>().hours;


    return Row(
      children: [
        _initHours > 0 ?
        IconButton(onPressed: (){
            context.read<TimeProvider>().removeHours();
    
         
        }, icon: Icon(Icons.remove_circle)) : Container(),
        Center(child: Text(_initHours.toString() + '   '+'Hours')),
        _initHours < 24 ?
        IconButton(onPressed: (){
          context.read<TimeProvider>().addHours();
        }, icon: Icon(Icons.add_circle)) : Container()
    
      ],
    );
  }
}