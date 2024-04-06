import 'package:flutter/material.dart';

class CardChoice extends StatelessWidget {
  
 final String image;
  
  CardChoice({
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(image),
        ),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

List<String> cardChoicelist = [
  'assets/images/ellipseblue.png',
  'assets/images/ellipseyellow.png',
  'assets/images/ellipseperpple.png',
  
  'assets/images/ellipsegreen.png'
];