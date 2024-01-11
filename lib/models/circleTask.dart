import 'package:flutter/material.dart';

class CircleTask {
  Color color;
  double progress;
  String type;

  CircleTask({required this.color, required this.progress, required this.type});
  
}

List<CircleTask> circleDescription = [
  CircleTask(color: Colors.blue, progress: 70, type: "Domesticas"),
  CircleTask(color: Colors.yellow, progress: 50, type: "Crescimento Pessoal"),
  CircleTask(color: Colors.purple, progress: 60, type: "Saúde"),
  CircleTask(color: Colors.green, progress: 30, type: "Trabalho"),
];