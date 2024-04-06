import 'package:flutter/material.dart';

class InitTimeButton extends StatelessWidget {

  final VoidCallback ontap;
  InitTimeButton({
    required this.ontap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: ontap,
       
     
      child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width - 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.orange[800],
              
            ),
            child: Center(
              child: Text('Iniciar',
              
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
           fontFamily: "TitilliumWeb",
           color: Colors.white
                
              ),
              ),
            ),
          ),
    );
  }
}

