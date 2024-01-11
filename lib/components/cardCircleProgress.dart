import 'package:circular_progress_stack/circular_progress_stack.dart';
import 'package:flutter/material.dart';
import 'package:task_app/constants/constants.dart';

class CardCircleProgress extends StatelessWidget {
  Color color;
  double progress;
  String type;
  
  CardCircleProgress({
    required this.color, required this.progress, required this.type
  });

  @override
  Widget build(BuildContext context) {
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
        barValue: progress,
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