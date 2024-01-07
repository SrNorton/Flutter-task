import 'package:flutter/material.dart';
import 'package:progresso/progresso.dart';
import 'package:task_app/constants/constants.dart';

class CardTask extends StatelessWidget {
  const CardTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 15,
      height: 200,
    
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Kcontrast
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 12),
            child: Row(
              children: [
                Text("Lista de Compras",
                 style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        
                        fontFamily: "TitilliumWeb",
                      ),
                
                )
              ],
            ),
          ),
          SizedBox(height: 85,),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15,),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('45/80',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        
                        fontFamily: "TitilliumWeb",
                      ),
                    ),
                    Text('61%',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        
                        fontFamily: "TitilliumWeb",
                      ),
                    ),
          
                  ],
                ),
                //BARRA DE PROGRESSSO
    
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 35),
                            child: Progresso(
                                        progress: 0.61, 
                                        progressStrokeCap: StrokeCap.round,
                                        backgroundStrokeCap: StrokeCap.round,
                                        progressColor: Kgreenprogress,
                                    ),
                          ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}