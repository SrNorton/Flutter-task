






import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:task_app/components/barchart.dart';
import 'package:task_app/components/cardTaskCommitment.dart';
import 'package:task_app/components/cardTaskStudy.dart';
import 'package:task_app/components/cardTasksShopping.dart';

import 'package:task_app/components/profileImage.dart';
import 'package:task_app/components/profileName.dart';
import 'package:task_app/constants/constants.dart';
import 'package:task_app/database/dbRepository.dart';

import 'package:task_app/screens/dashPage.dart';


class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

        
        
   

    //CARD TAREFAS WIDGET

    Expanded(
      
      child: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
             
             CardTaskShopping(),
             CardTaskStudy(),
             CardTaskCommitment()
              
            
            ],
          ),
        ),
        
        
        
       
      ),
    )



   

        ],
      ),
     
    
      
    );
    
  }
}



