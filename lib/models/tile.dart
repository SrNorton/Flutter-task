import 'package:flutter/material.dart';

class Tile {
  int? id;
  String? image;
  String? descriptionTask;
  bool? status;

  Tile({this.id ,this.image, this.descriptionTask, this.status});

  Tile.fromMap(Map<String, dynamic> map) {
     
      this.id = map['id'];
      this.image = map['type'];
      this.descriptionTask = map['description'];
      this.status = map['status'];
    
  }


  
}

List<Tile> tasksTotile = [
  Tile(image: 'assets/images/ellipseblue.png', descriptionTask: 'Comprar sabão'),
  Tile(image: 'assets/images/ellipseyellow.png', descriptionTask: 'Meditar'),
  Tile(image: 'assets/images/ellipseperpple.png', descriptionTask: 'beber água'),

  Tile(image: 'assets/images/ellipsegreen.png', descriptionTask: 'Terminar o aplicativo'),
  Tile(image: 'assets/images/ellipseperpple.png', descriptionTask: 'Tomar o remédio'),
  Tile(image: 'assets/images/ellipsegreen.png', descriptionTask: 'organizar projeto'),

  Tile(image: 'assets/images/ellipseyellow.png', descriptionTask: 'Ler o livro'),
  Tile(image: 'assets/images/ellipseblue.png', descriptionTask: 'Limpar varanda'),
]; 