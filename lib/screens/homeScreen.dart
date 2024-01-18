import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:task_app/components/barchart.dart';
import 'package:task_app/components/cardTasks.dart';
import 'package:task_app/constants/constants.dart';

import 'package:task_app/models/cardModel.dart';



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
        SizedBox(height: 20,),
        Padding(
                     padding: const EdgeInsets.only(left: 25),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("OLá,\nAline",
               style: TextStyle(
                
              height: 1,
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.w800,
                            fontFamily: "TitilliumWeb",
                          ),
              ),
              // Container(
              //   child: Image.asset("assets/images/pie.png",
              //   height: 100,
              //   width: 200,
              //   ),
              // ),
            ],
          ),
        ),
         
        //chart

        //Model 1
        SizedBox(
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: BarChartSample1()),

        
        
    // SizedBox(height: 10,),


    //CARD TAREFAS WIDGET

    Expanded(
      
      child: Container(
        child: ListView.builder(
          itemCount: cardlist.length,
          itemBuilder: (context, index) {
          return CardTask(title: cardlist[index].title, progress: cardlist[index].progress);
        }),
      ),
    )



   

        ],
      ),
     
    
      
    );
    
  }
}

