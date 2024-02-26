import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:task_app/components/editHours.dart';
import 'package:task_app/components/editMinutes.dart';
import 'package:task_app/constants/constants.dart';
import 'package:task_app/database/dbRepository.dart';
import 'package:task_app/manager/timeManager.dart';
import 'package:task_app/models/meeting.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _textController = TextEditingController();


  
   
  


  

 String? _seelectDate;

 
  
 
 
  



 @override
  Widget build(BuildContext context) {

    Random random = Random();
    int r = random.nextInt(255);
    int g = random.nextInt(255);
    int b = random.nextInt(255);

  
   
 
    

    

    

    
    
    

    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Kbackground,
        title: Text('Calendário',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          fontFamily: "TitilliumWeb",
        )
        ),
      ),
        body: SfCalendar(
          key: UniqueKey(),
          view: CalendarView.month,
          allowedViews: <CalendarView>[
            CalendarView.day,
            CalendarView.month,
            CalendarView.workWeek,
            CalendarView.schedule,
            CalendarView.timelineDay,
            CalendarView.timelineWeek,
            CalendarView.timelineWorkWeek,
            CalendarView.timelineMonth
          ],
          
          dataSource: MeetingDataSource(_getDataSource()),
          monthViewSettings: 
          MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
              showAgenda: true,
              
              ),
              onTap: newCommitment,
              
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 60),
          child: FloatingActionButton(
            
            child: Icon(Icons.add),
            backgroundColor: Colors.blue,
            highlightElevation: 60,
            onPressed: (){
              showDialog(
                
                barrierDismissible: false,
                context: context,
              builder: (BuildContext context){
                 final data = context.read<DbRepository>();
   final datahours = context.read<TimeProvider>();
   final dataminutes = context.read<TimeProvider>();
                
                return 
                Form(
                  key: _formKey,
                  child: AlertDialog(
                    title: Text('Novo Compromisso',
                    style: TextStyle(
                      color: Colors.blue,
                            fontFamily: "TitilliumWeb",
                  
                      
                    ),
                    ),
                    content: TextFormField(
                      controller: _textController,
                      validator: (value){
                        if(value == null || value.isEmpty){return 'Insira a descrição do compromisso';}
                        if(value.length > 40){'Insira uma curta descrição sobre o compromisso';}
                  
                        return null;
                      },
                      
                      decoration: InputDecoration(
                        focusColor: Colors.green,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          
                        )
                      ),
                      
                    ),
                    actions: <Widget> [
                      EditHours(),
                      SizedBox(height: 15,),
                      EditMinutes(),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           IconButton(onPressed: ()async{
                            await context.read<DbRepository>().readCommitment();
                           
                          // loadDates(context);
                          //    list = loadDates(context);
                          //    print('a lista abaixo');
                          //    print(list[0].eventName);
                        Navigator.pop(context);
                      }, icon: Icon(Icons.undo_rounded,
                      color: Colors.purple,
                      )),
                      
                      IconButton(onPressed: () async{
                       
                       
                        if(_formKey.currentState!.validate()){
                          await data.setCommitiment(
     description: _textController.text,
     date: _seelectDate,
     hours: datahours.hours,
     minutes: dataminutes.minutes,
     colorA: 255,
     colorR: r,
     colorG: g,
     colorB: b,
    );  

    context.read<DbRepository>().readCommitment();
   
    
                        // context.findAncestorStateOfType<_CalendarState>()?.build(context);
                        setState(() {
                          
                        });
                        _textController.clear();
                        Navigator.of(context).pop();

                        } else {
                          return null;
                        }
                  
                  
                      }, icon: Icon(Icons.send_rounded),
                      color: Colors.purple,
                      ),
                        ],
                      ),
                     Center(
                       child: Text('O compromisso será salvo no dia selecionado com um toque',
                       style: TextStyle(
                        color: Colors.red,
                        fontSize: 13,
                       ),
                       ),
                     )
                     
                    ]
                  ),
                );
              });
            }),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        
        );
  }

 

  newCommitment(CalendarTapDetails detail) {
    
    
    _seelectDate = detail.date.toString();
    
    
    
    
    
    print('esta é a data $_seelectDate');

  }

 

  //metodo para o set do compromisso
   _getDataSource()  {
    
    
    final List<Meeting> meetings = context.read<DbRepository>().listMeetingDb;
    
    // final DateTime today = DateTime.now();
    // final DateTime startTime = today;
    
    // final DateTime endTime = startTime.add(const Duration(hours: 2));
    
    // meetings.add(
    //    Meeting(eventName: 'Curtir o descanso', year: 2024, month: 02, day: 16, hours: 12, minutes: 00, to: endTime, background: Colors.green, isAllDay: false),
        
    //     );
    return meetings;
  }
 
   

  
}





class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource( List<Meeting> source){
    appointments = source;
   

  }


  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }

  
}


