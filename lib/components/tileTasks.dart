import 'package:flutter/material.dart';
import 'package:task_app/components/statusTask.dart';
import 'package:task_app/models/tile.dart';

class TileTask extends StatelessWidget {

  
   String? image;
   String? task;
  TileTask({required this.image, required this.task});
  
  
  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Row(
          children: [
           
            Container(
              height: 60,
              width: 60,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(image!),
              ),
            ),
            Expanded(
              child: 
              Container(
                child: Text(task!,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
                ),
              ),),
              StatusTask(),

          ],),
      ),

    );
  }
}