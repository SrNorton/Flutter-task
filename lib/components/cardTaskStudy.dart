import 'package:flutter/material.dart';
import 'package:progresso/progresso.dart';
import 'package:provider/provider.dart';
import 'package:task_app/constants/constants.dart';
import 'package:task_app/database/dbRepository.dart';
import 'package:task_app/screens/timerStudyScreen.dart';

class CardTaskStudy extends StatefulWidget {
  const CardTaskStudy({super.key});

  @override
  State<CardTaskStudy> createState() => _CardTaskStudyState();
}

class _CardTaskStudyState extends State<CardTaskStudy> {
  @override
  Widget build(BuildContext context) {


    var listTotal = context.watch<DbRepository>().listTimeStudy;


    double percentageWeekStudy(){
    var total = listTotal.length;
    

    var result = total * 14.28;

   return  result/100;


    }


var formated = percentageWeekStudy().toStringAsFixed(2);



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
                  Text('Tempo de Estudo',
                   style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          
                          fontFamily: "TitilliumWeb",
                        ),
                  
                  ),
                  IconButton(
                    onPressed:  (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> TimerStudyScreen()));
                    },
                    
                  
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                     
                   
                    Text((double.parse(formated) * 100).toStringAsFixed(2)+"%",
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
                                          
                                          progress: double.parse(formated), 
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