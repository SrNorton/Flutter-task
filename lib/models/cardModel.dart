class Card {
  String title;
  double progress;

  Card({required this.title, required this.progress});
}


List<Card> cardlist = [
  Card(title: "Lista de Compras", progress: 61.0),
  Card(title: "Estudos", progress: 70.0),
  Card(title: "Compromissos", progress: 80.0),
  Card(title: "Contas a pagar", progress: 75.0),
];