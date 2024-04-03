


import 'package:daily_task/components/barchart.dart';
import 'package:daily_task/components/cardTasks.dart';
import 'package:daily_task/constants/constants.dart';
import 'package:daily_task/database/dbRepository.dart';
import 'package:daily_task/screens/dashPage.dart';
import 'package:daily_task/screens/editProfile.dart';
import 'package:daily_task/screens/shoppingListScreen.dart';
import 'package:daily_task/screens/timerStudyScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<DbRepository>().readStudydata();


    var listTotal = context.watch<DbRepository>().listShopping;
    var listShoppingDone = listTotal.where((e) => e['status'] == 'true').toList();


  double percentage (){
    var total = listTotal.length;
    var percent = listShoppingDone.length * 100/ total;
    var result = percent/100;
    return total == 0 ? 0 : result;
  }







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
                      child: Container(
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
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => EditProfile()));
              }, icon: Icon(Icons.edit,
              color: Colors.grey,
              ))
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
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CardTask(title: 'Estudo', progress: 0.5, function: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> TimerStudyScreen()));

              }
              
                // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> TimerStudyScreen()));
            ),
              CardTask(title: 'Lista de Compras', progress: percentage(), function: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> ShoppingListScreen()));

              },),
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

