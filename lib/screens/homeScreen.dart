






import 'package:flutter/material.dart';

import 'package:task_app/components/barchart.dart';
import 'package:task_app/components/cardTasksShopping.dart';

import 'package:task_app/components/profileImage.dart';
import 'package:task_app/components/profileName.dart';
import 'package:task_app/constants/constants.dart';

import 'package:task_app/screens/dashPage.dart';


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

                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => DashPage(
                           
                          )));
                      },

                      
                      child:
                       Container(
                        child: Image.asset("assets/images/dashicon.png",
                        height: 30,
                        width: 30,
                        ),
                      ),
                    ),
              ],
            ),
            
          
     
          ),
          SizedBox(height: 40,),
         Padding(
           padding: const EdgeInsets.only(left: 25),
           child: ProfileImage(),
         ),
        SizedBox(height: 20,),
        Padding(
                     padding: const EdgeInsets.only(left: 25),

          child: ProfileName(),
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
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // CardTask(title: 'Estudo', progress: 0.5, function: (){
              //   Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> TimerStudyScreen()));

              // }
              
            CardTaskShopping(),
            ],
          ),
        ),
        
        
        
        // ListView.builder(
        //   scrollDirection: Axis.horizontal,
        //   itemCount: cardlist.length,
        //   itemBuilder: (context, index) {
        //   return CardTask(title: cardlist[index].title, progress: cardlist[index].progress,
        //   function: ()=> print('card'),
           
          
        //   );
        // }),
      ),
    )



   

        ],
      ),
     
    
      
    );
    
  }
}



