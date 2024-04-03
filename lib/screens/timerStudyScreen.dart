

 


import 'package:daily_task/components/focusTimeController.dart';
import 'package:daily_task/components/initTimeButton.dart';
import 'package:daily_task/database/dbRepository.dart';
import 'package:daily_task/manager/focustTimeManager.dart';
import 'package:flutter/material.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';

class TimerStudyScreen extends StatefulWidget {
  @override
  State<TimerStudyScreen> createState() => _TimerStudyScreenState();
}

class _TimerStudyScreenState extends State<TimerStudyScreen> {
  final CountDownController controller = new CountDownController();

  



  @override
  Widget build(BuildContext context) {

       var data = context.read<DbRepository>();


      final DateTime weekday = DateTime.now();
      int timeProvider = context.watch<FocusTimeManager>().timefocus;
      int timer = timeProvider * 60;
      var dayName;
      



      void setTime(){
      
          switch (weekday.weekday) {
      case  1:
     dayName =  'Mon';
        
        break;
        case 2:
       dayName = 'Tue';
       break;
        case 3:
        
       dayName = 'Wed';
       break;
        case 4:
       dayName = 'Thu';
       break;
       case 5:

       dayName = 'Fri';
       break;

       case 6:

       dayName = 'Sat';
       break;

       case 7:
       dayName = 'Sun';

      default:
      dayName = 'Error Day';
    }

    if(dayName == 'Mon') 
    {
      data.deleteStudieDb();
    }

    data.setStudyTime(
      time: timeProvider,
      weekday: dayName
      );
        
        
          
        setState(() {
        // timer = timeProvider;
        });
        print('Minutos selecionados $timeProvider');
        print(dayName);
        // Navigator.of(context).pushReplacement(MaterialPageRoute(
          
        //   builder: (BuildContext context){
        //   return TimerStudyScreen();
        // }));
       

      }
      



    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
color: Colors.white
        ),
        backgroundColor: Colors.transparent,
        title: const Text(
          'Focus Time',
          style:TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          fontFamily: "TitilliumWeb",
                        ),

        ),
      ),
      backgroundColor: Kbackground,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 200,),
            child:  Center(
               child:  NeonCircularTimer(
                key: UniqueKey(),
                width: 200,
                    duration: timer,
                    controller : controller,
                    isTimerTextShown: true,
                    neumorphicEffect: true,
                    innerFillGradient:  LinearGradient(colors: [
                      Colors.greenAccent.shade200,
                      Colors.blueAccent.shade400
                    ]),
                    neonGradient: LinearGradient(colors: [
                      Colors.greenAccent.shade200,
                      Colors.blueAccent.shade400
                    ]),
                   ),
             
            ),
          ),
          Padding(
            padding:const EdgeInsets.all(40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                  IconButton(
                              icon: Icon(Icons.play_arrow,
                              color: Colors.amber[700],
                              ),
                              onPressed: () {
                                controller.resume();
                              }),
                          IconButton(
                              icon: Icon(Icons.pause,
                              color: Colors.amber[700],
                              
                              ),
                              onPressed: () {
                                controller.pause();
                              }),
                          IconButton(
                              icon: Icon(Icons.repeat,
                              color: Colors.amber[700],
                              
                              ),
                              onPressed: () {
                                controller.restart();
                              }),
              ],
            ),
            ),

             FocusTimeController(),

           const SizedBox(height: 35,),

             InitTimeButton(
                ontap: setTime,
             ),
   const SizedBox(height: 8,),
    const Text('O tempo selecionado será salvo no gráfico da tela inicial',
    style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
                  fontFamily: "TitilliumWeb",
                  color: Colors.white
          
        ),
    )
        ],
      ),

    );
  }
}

