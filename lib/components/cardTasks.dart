import 'package:daily_task/constants/constants.dart';
import 'package:daily_task/database/dbRepository.dart';
import 'package:flutter/material.dart';
import 'package:progresso/progresso.dart';
import 'package:provider/provider.dart';

class CardTask extends StatefulWidget {
  String title;
  double progress;
  VoidCallback function;
  
   CardTask({
    required this.title, required this.progress, required this.function
  });

  @override
  State<CardTask> createState() => _CardTaskState();
}

class _CardTaskState extends State<CardTask> {

  final mykey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
         context.read<DbRepository>().readListShopping();
    
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 15, bottom: 15),
      child: Container(
        width: MediaQuery.of(context).size.width - 15,
        height: 223,
      
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.title,
                   style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          
                          fontFamily: "TitilliumWeb",
                        ),
                  
                  ),
                  IconButton(
                    onPressed:  widget.function,
                    
                  
                  icon: Icon(Icons.arrow_circle_right_outlined,
                  color: Colors.blueAccent,
                  ))
                ],
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15,),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          
                          fontFamily: "TitilliumWeb",
                        ),
                      ),
                      Text((widget.progress * 100).toString()+"%",
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
                                          
                                          progress: widget.progress, 
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