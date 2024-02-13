import 'package:flutter/material.dart';
import 'package:progresso/progresso.dart';
import 'package:task_app/constants/constants.dart';

class CardTask extends StatefulWidget {
  String title;
  double progress;
  
   CardTask({
    required this.title, required this.progress
  });

  @override
  State<CardTask> createState() => _CardTaskState();
}

class _CardTaskState extends State<CardTask> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 15, bottom: 15),
      child: Container(
        width: MediaQuery.of(context).size.width - 15,
        height: 200,
      
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue
          ),
          borderRadius: BorderRadius.circular(30),
          color: Kcontrast
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 12),
              child: Row(
                children: [
                  Text(widget.title,
                   style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          
                          fontFamily: "TitilliumWeb",
                        ),
                  
                  )
                ],
              ),
            ),
            SizedBox(height: 85,),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15,),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('45/80',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          
                          fontFamily: "TitilliumWeb",
                        ),
                      ),
                      Text(widget.progress.toString()+"%",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          
                          fontFamily: "TitilliumWeb",
                        ),
                      ),
            
                    ],
                  ),
                  //BARRA DE PROGRESSSO
      
                            Padding(
                              padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 35),
                              child: Progresso(
                                          progress: 50.0, 
                                          progressStrokeCap: StrokeCap.round,
                                          backgroundStrokeCap: StrokeCap.round,
                                          progressColor: Kgreenprogress,
                                      ),
                            ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}