import 'package:circular_progress_stack/circular_progress_stack.dart';
import 'package:flutter/material.dart';
import 'package:task_app/components/cardCircleProgress.dart';
import 'package:task_app/components/smallAddButom.dart';
import 'package:task_app/components/tileTasks.dart';
import 'package:task_app/constants/constants.dart';
import 'package:task_app/models/circleTask.dart';
import 'package:task_app/models/tile.dart';

class DashPage extends StatefulWidget {
  DashPage({this.tile});
  Tile? tile;

  @override
  State<DashPage> createState() => _DashPageState();
}

class _DashPageState extends State<DashPage> {
 
  @override
  
  Widget build(BuildContext context) {
   
    return Scaffold(
       
      backgroundColor: Kbackground,
      appBar: AppBar(
        
        title: Text(
          "Dailytasks",
          style:TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      fontFamily: "TitilliumWeb",
                    ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: AddButom(
            
          
            
          ),
        ),
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
              child: ListView.builder(
                itemCount: tasksTotile.length,
                itemBuilder: (context, index){
                  return TileTask(
                    image: tasksTotile[index].image,
                    description: tasksTotile[index].descriptionTask,
                  );
                })
            ),
          ),
        ],
      ),
    );
  }
}

