import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:task_app/components/editHours.dart';
import 'package:task_app/components/editMinutes.dart';
import 'package:task_app/constants/constants.dart';
import 'package:task_app/models/meeting.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _textController = TextEditingController();
  
  


  var valueMinutes;

 var _seelectDate;

 
 

 @override
  Widget build(BuildContext context) {
 


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
        body: Form(
          key: _formKey,
          child: SfCalendar(
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
                onLongPress: newCommitment,
                
          ),
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
                
                return 
                AlertDialog(
                  title: Text('Novo Compromisso',
                  style: TextStyle(
                    color: Colors.blue,
                          fontFamily: "TitilliumWeb",

                    
                  ),
                  ),
                  content: TextFormField(
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
                         IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.undo_rounded,
                    color: Colors.purple,
                    )),
                    
                    IconButton(onPressed: (){}, icon: Icon(Icons.send_rounded),
                    color: Colors.purple,
                    ),
                      ],
                    ),
                   
                  ]
                );
              });
            }),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        
        );
  }

    void newCommitment(CalendarTouchDetails detail){
    
    
    _seelectDate = detail.date;
    
    
    print('esta é a data $_seelectDate');

  }

 

  //metodo para o set do compromisso
  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = today;
    
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    
    meetings.add(
       Meeting(eventName: 'Curtir o carnavoso', year: 2024, month: 02, day: 13, hours: 12, minutes: 00, to: endTime, background: Colors.green, isAllDay: false),
        
        );
    return meetings;
  }

  
}





class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source){
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


