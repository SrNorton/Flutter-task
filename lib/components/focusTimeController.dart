


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/manager/focustTimeManager.dart';

class FocusTimeController extends StatelessWidget {
  

  

  @override
  Widget build(BuildContext context) {
    var timer = context.watch<FocusTimeManager>().timefocus;
    return Row(
     mainAxisAlignment: MainAxisAlignment.spaceAround,
     children: [
        timer > 0 ? IconButton(
                     icon: Icon(Icons.remove_circle,
                     size: 30,
                     color: Colors.red,
                     ),
                     onPressed: () {
                       context.read<FocusTimeManager>().removeTimer();
                     }) : Container(),
                 Text(timer.toString(),
                 style: TextStyle(
                   fontSize: 35,
                   color: Colors.white
                 ),
                 ),
                 IconButton(
                     icon: Icon(Icons.add_circle,
                     color: Colors.greenAccent[700],
                     size: 30,
                     
                     ),
                     onPressed: () {
                       context.read<FocusTimeManager>().addTimer();
                       
                     }),
     ],
                );
  }
}