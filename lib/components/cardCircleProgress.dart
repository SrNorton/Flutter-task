



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/database/dbRepository.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import '../constants/constants.dart';

class CardCircleProgress extends StatelessWidget {
   final Color color;
  final int progress ;
  final String type;
  
  CardCircleProgress({
    required this.color, required this.progress, required this.type
  });
  
  

  @override
  Widget build(BuildContext context) {

      ValueNotifier<double> _valueNotifier = ValueNotifier(0);
   
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
   
   
    _valueNotifier.value = getpercentage(progress: progress);


    
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
            padding: const EdgeInsets.only(top: 20, left: 12, right: 12, bottom: 20),
            
            child: SizedBox(
              height: 115,
              child: DashedCircularProgressBar.aspectRatio(
                aspectRatio: 1,
                 // width ÷ height
                valueNotifier: _valueNotifier,
                progress: getpercentage(progress: progress),
                startAngle: 225,
                sweepAngle: 270,
                foregroundColor: color,
                backgroundColor: const Color(0xffeeeeee),
                foregroundStrokeWidth: 12,
                backgroundStrokeWidth: 12,
                animation: true,
                seekSize: 6,
                seekColor: const Color(0xffeeeeee),
                child: Center(
                  child: ValueListenableBuilder(
                    valueListenable: _valueNotifier,
                    builder: (_, double value, __) =>Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [ 
                         Text(
                            '${value.toInt()}%',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 16
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                ),
            ),
         
          ),
          Text(type,
          style: TextStyle(
            color: Colors.white
          ),
          )
        ],
      ),
    );
  }
}