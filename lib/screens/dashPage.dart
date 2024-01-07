import 'package:circular_progress_stack/circular_progress_stack.dart';
import 'package:flutter/material.dart';
import 'package:task_app/constants/constants.dart';

class DashPage extends StatefulWidget {
  const DashPage({super.key});

  @override
  State<DashPage> createState() => _DashPageState();
}

class _DashPageState extends State<DashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kbackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: 500,
            width: MediaQuery.of(context).size.width,
            child: GridView.count(crossAxisCount: 2,
            children: List.generate(4, (index) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 200,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Kcontrast,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 50),
                    child:  SingleAnimatedStackCircularProgressBar(
        size: 100,
        progressStrokeWidth: 15,
        backStrokeWidth: 15,
        startAngle: 0,
        backColor: Color(0xffD7DEE7),
        barColor: Kgreenprogress,
        barValue: 70,
        textStyle: TextStyle(
          color: Colors.white
        ),
      ),
                  ),
                ),
              );
            })
          
            
            ),
          )
        ],
      ),
    );
  }
}