import 'package:flutter/material.dart';

class Tile {
  String? image;
  String? descriptionTask;

  Tile({required this.image, required this.descriptionTask});
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