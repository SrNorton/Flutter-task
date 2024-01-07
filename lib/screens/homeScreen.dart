import 'package:flutter/material.dart';
import 'package:task_app/components/cardTasks.dart';
import 'package:task_app/constants/constants.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';



class HomePage extends StatelessWidget {
   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kbackground,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60, left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                      "DashLife",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      fontFamily: "TitilliumWeb",
                    ),
                    
                    ),

                    Container(
                      child: Image.asset("assets/images/dashicon.png",
                      height: 30,
                      width: 30,
                      ),
                    ),
              ],
            ),
            
          
     
          ),
          SizedBox(height: 40,),
         Padding(
           padding: const EdgeInsets.only(left: 25),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
             children: [
               CircleAvatar(
                radius: 35,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset("assets/images/avatar.png",
                  fit: BoxFit.fitWidth,
                  // fit: BoxFit.cover,
                  ),
                ),
               ),
             ],
           ),
         ),
        SizedBox(height: 30,),
        Padding(
                     padding: const EdgeInsets.only(left: 25),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("OLá,\nAline",
               style: TextStyle(
                
              height: 1,
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.w800,
                            fontFamily: "TitilliumWeb",
                          ),
              ),
              Container(
                child: Image.asset("assets/images/pie.png",
                height: 100,
                width: 200,
                ),
              ),
            ],
          ),
        ),
         SizedBox(height: 30,),
        //Calendar

        //Model 1
        Padding(
          padding: const EdgeInsets.only(left: 28, right: 28),
          child: Container(
           
            transform: Matrix4.rotationX(1.0),
            
            child: EasyDateTimeLine(
                initialDate: DateTime.now(),
                onDateChange: (selectedDate) {
            //`selectedDate` the new date selected.
                },
                headerProps: const EasyHeaderProps(
                  selectedDateStyle: TextStyle(
                    color: Colors.white,
                  ),
                  monthStyle: TextStyle(
                    color: Colors.white,
                  ),
            monthPickerType: MonthPickerType.switcher,
            selectedDateFormat: SelectedDateFormat.fullDateDMY,
                ),
                dayProps: EasyDayProps(
                  todayStyle: DayStyle(
                    dayNumStyle: TextStyle(
                color: Colors.white
              ),
                  ),
            dayStructure: DayStructure.dayStrDayNum,
            inactiveDayStyle: DayStyle(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 64, 85, 95),
              ),
              dayStrStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
              dayNumStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
              
            ),
            activeDayStyle: DayStyle(
              
              decoration: BoxDecoration(
                
                borderRadius: BorderRadius.all(Radius.circular(8)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    // Color(0xff3371FF),
                    // Color(0xff8426D6),
                    Color.fromRGBO(42, 247, 127, 0.612),
                    Color.fromRGBO(4, 197, 245, 0.612),
                    
                  ],
                ),
              ),
            ),
                ),
              ),
          ),
        ),
    // SizedBox(height: 10,),


    //CARD TAREFAS WIDGET

    SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          CardTask(),
          
        ],
      ),
    ),



   

        ],
      ),
     
    
      
    );
    
  }
}

