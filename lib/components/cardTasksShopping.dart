
import 'package:flutter/material.dart';
import 'package:progresso/progresso.dart';
import 'package:provider/provider.dart';
import 'package:task_app/constants/constants.dart';
import 'package:task_app/database/dbRepository.dart';
import 'package:task_app/screens/shoppingListScreen.dart';

class CardTaskShopping extends StatelessWidget {
  
  
   CardTaskShopping(
    
  );

  final mykey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

           var listTotal = context.watch<DbRepository>().listShopping;
    var itemShoppingDone = listTotal.where((e) => e['status'] == 'true').toList();


  double percentage (){
    var total = listTotal.length;
    var percent = itemShoppingDone.length * 100/ total;
    var result = percent/100;
    
    return total == 0 ? 0 : result;
  }


  var formated = percentage().toStringAsFixed(2);

    
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 15, bottom: 15),
      child: Container(
        width: MediaQuery.of(context).size.width - 15,
        height: 223,
      
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue
          ),
          borderRadius: BorderRadius.circular(30),
          color: Kcontrast
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Lista de Compras',
                   style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          
                          fontFamily: "TitilliumWeb",
                        ),
                  
                  ),
                  IconButton(
                    onPressed:  (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> ShoppingListScreen()));
                    },
                    
                  
                  icon: Icon(Icons.arrow_circle_right_outlined,
                  color: Colors.blueAccent,
                  ))
                ],
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15,),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          
                          fontFamily: "TitilliumWeb",
                        ),
                      ),
                      Text((double.parse(formated) * 100).toString()+"%",
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
                              padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 35),
                              child: Progresso(
                                          
                                          progress: double.parse(formated), 
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
      ),
    );
  }
}