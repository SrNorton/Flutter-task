import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:task_app/constants/constants.dart';
import 'package:task_app/screens/commitmentScreen.dart';

class CardTaskCommitment extends StatelessWidget {
  const CardTaskCommitment({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Text('Compromissos ',
                   style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          
                          fontFamily: "TitilliumWeb",
                        ),
                  
                  ),
                  IconButton(
                    onPressed:  (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> CommitmentScreen()));
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                       DefaultTextStyle(
    style: const TextStyle(
      fontSize: 20.0,
      fontFamily: "TitilliumWeb",
      fontWeight: FontWeight.bold,
      color: Colors.greenAccent
      
              ),
              child: AnimatedTextKit(
                
                pause: Duration(milliseconds: 2000),
                animatedTexts: [
                  TypewriterAnimatedText('Os Compromissos salvos no calendário\n podem ser vistos aqui'),
                  TypewriterAnimatedText('Os Compromissos salvos no calendário\n podem ser vistos aqui'),

                 
                ],
                // onTap: () {
                //   print("Tap Event");
                // },
    ),
  ),
            
                    ],
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