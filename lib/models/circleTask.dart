import 'package:flutter/material.dart';

class CircleTask {
  Color color;
  
  String type;

  CircleTask({required this.color,  required this.type});

 
}

List<CircleTask> circleDescription = [
  CircleTask(color: Colors.blue,  type: "Domésticas"),
  CircleTask(color: Colors.yellow,  type: "Crescimento Pessoal"),
  CircleTask(color: Colors.purple,  type: "Saúde"),
  CircleTask(color: Colors.green,   type: "Trabalho"),
];