import 'package:circular_progress_stack/circular_progress_stack.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:task_app/constants/constants.dart';
import 'package:task_app/database/dbRepository.dart';


class CardCircleProgress extends StatelessWidget {
   final Color color;
  final int progress ;
  final String type;
  
  CardCircleProgress({
    required this.color, required this.progress, required this.type
  });
  
  

  @override
  Widget build(BuildContext context) {
   
   
    var listFilter = context.watch<DbRepository>().listTileBuilder;
    var listGreenInProgress = listFilter.where((e) => e['type'] == 'assets/images/ellipsegreen.png' && e['status'] == 'false').toList();
   
    var listBlueInProgress = listFilter.where((e) => e['type'] == 'assets/images/ellipseblue.png' && e['status'] == 'false').toList();
    var listBluedone = listFilter.where((e) => e['type'] == 'assets/images/ellipseblue.png' && e['status'] == 'true').toList();
    var listYellowDone = listFilter.where((e) => e['type'] == 'assets/images/ellipseyellow.png' && e['status'] == 'true').toList();
    var listYellowInProgress = listFilter.where((e) => e['type'] == 'assets/images/ellipseyellow.png' && e['status'] == 'false').toList();
    var listPerppleInProgress = listFilter.where((e) => e['type'] == 'assets/images/ellipseperpple.png' && e['status'] == 'false').toList();
    var listPerppleInDone = listFilter.where((e) => e['type'] == 'assets/images/ellipseperpple.png' && e['status'] == 'true').toList();
    var listGreenDone = listFilter.where((e) => e['type'] == 'assets/images/ellipsegreen.png' && e['status'] == 'true').toList();
    
  


    double percentageBlue () {
    
    var total = listBluedone.length + listBlueInProgress.length;
      
      return  total == 0 ? 0 :   listBluedone.length * 100 / total;
      
    } 

    double percentageYellow (){
      var total = listYellowDone.length + listYellowInProgress.length;
      // print('este é o valor total $total');
      
      return total == 0 ? 0 : listYellowDone.length * 100 / total;
    }

    double percentagePerpple (){
      var total = listPerppleInDone.length + listPerppleInProgress.length;
      return  total == 0 ? 0 :  listPerppleInDone.length * 100 / total;
    }

    double percentageGreen (){
      var total = listGreenDone.length + listGreenInProgress.length;
      
      return  total == 0 ? 0 :   listGreenDone.length * 100 / total;
    }
   

   double getpercentage({int? progress}) {
    if(progress == 0){
      return percentageBlue();
    } else if (progress == 1) {
      return percentageYellow();
    } else if(progress == 2){
      return percentagePerpple();
    } else {
      return percentageGreen();
    }
    
   }
   
   
    

    
    return Container(
      height: 210,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Kcontrast,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 50),
            child:  SingleAnimatedStackCircularProgressBar(
        size: 78,
        progressStrokeWidth: 15,
        backStrokeWidth: 15,
        startAngle: 0,
        backColor: Color(0xffD7DEE7),
        barColor: color,
        barValue: getpercentage(progress: progress),
          
        




        textStyle: TextStyle(
              color: Colors.white
        ),
      ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 7),
            child: Text(type,
            style: TextStyle(
              color: Colors.white
            ),
            ),
          )
        ],
      ),
    );
  }
}