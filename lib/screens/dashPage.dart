import 'package:circular_progress_stack/circular_progress_stack.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/components/cardCircleProgress.dart';
import 'package:task_app/components/smallAddButom.dart';
import 'package:task_app/components/tileTasks.dart';
import 'package:task_app/constants/constants.dart';
import 'package:task_app/database/dbRepository.dart';
import 'package:task_app/models/circleTask.dart';
import 'package:task_app/models/tile.dart';

class DashPage extends StatefulWidget {
  
  DashPage();
  // Tile? tile;
  
  

  @override
  State<DashPage> createState() => _DashPageState();
}

class _DashPageState extends State<DashPage> {




  
 
  @override
  
  Widget build(BuildContext context) {
  
 

  
          context.read<DbRepository>().readallData();
  

   
    return Scaffold(
      
       
      backgroundColor: Kbackground,
      appBar: AppBar(
        iconTheme: IconThemeData(
color: Colors.white
        ),
        
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Dailytasks",
              style:TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          fontFamily: "TitilliumWeb",
                        ),
            ),
            SizedBox(
              height: 55,
              width: 55,
              child: AddButom())
          ],
        ),
        // leading: Padding(
        //   padding: const EdgeInsets.only(left: 8.0),
        //   child: AddButom(
            
          
            
        //   ),
        // ),
        backgroundColor: Colors.transparent,
        
        elevation: 0,
      ),
      
      body: Column(
        
        children: [
          Column(
            children: [
              Container(
                
                height: 450,
                width: MediaQuery.of(context).size.width,
                child: GridView.count(crossAxisCount: 2,
                children: List.generate(circleDescription.length, (index) {
                 
                 
                    

                  
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CardCircleProgress(color: circleDescription[index].color, progress: circleDescription[index].progress, type: circleDescription[index].type,),
                  );
                })
              
                
                ),
              ),
              
            ],
          ),
          Expanded(
            
            child: Container(
              
              width: MediaQuery.of(context).size.width,
              color: Kbackground,
              child: Consumer<DbRepository>(
                
                builder: (BuildContext ctx, dbrepository,__){
                 
                
                  
                 
                    
                  
                  return ListView.builder(
                    
                    itemCount: dbrepository.listTileBuilder.length,
                    itemBuilder: (BuildContext ctx, int index){
                      return TileTask(image: dbrepository.listTileBuilder[index]['type'],
                      task: dbrepository.listTileBuilder[index]['description'],
                      id: dbrepository.listTileBuilder[index]['id'],
                      tilebool: dbrepository.listTileBuilder[index]['status'],
                      );
                      
                    }
                    
                    );
                    
                }
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// Expanded(
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               color: Kbackground,
//               child: ListView.builder(
//                 itemCount: tasksTotile.length,
//                 itemBuilder: (context, index){
//                   return TileTask(
//                     image: tasksTotile[index].image,
//                     description: tasksTotile[index].descriptionTask,
//                   );
//                 })
//             ),
//           ),
//         ],

