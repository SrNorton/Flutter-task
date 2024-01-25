import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/components/butomSave.dart';
import 'package:task_app/components/cardChoice.dart';
import 'package:task_app/database/db.dart';
import 'package:task_app/database/dbRepository.dart';

class TextForm extends StatefulWidget {
  TextForm({super.key});

  

  

  @override
  State<TextForm> createState() => _TextFormState();
  

  
}

class _TextFormState extends State<TextForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _textController = TextEditingController();

 

  
   int? select;

   
 
 

  

  
  
  @override
  Widget build(BuildContext context) {
    
 final data = context.read<DbRepository>();


  

   

    
    
    
    
    
   
     
   
    
    
    
    
  
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: 50,),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: _textController,
                validator: (value){
                  if(value == null || value.isEmpty){return 'Insert one task';}
                  if(value.length > 25){return 'Give a shorter description';}
                  
                return null;
                },
                
                decoration: InputDecoration(
                  
                  hintText: 'add your task',
                  border: OutlineInputBorder(
                    
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              ),
            ),
          ),

          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 110,
                
              ),
              itemCount: cardChoicelist.length,
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      select = index;
                    print(select);
                    });


    
                    
                    
                  },
                  child: CardChoice(
                    image: cardChoicelist[index],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 100,),

          //butom
          
          GestureDetector(
            onTap: ()async{
              String? type;
    
     switch (select) {
          case 0:
          type = 'assets/images/ellipseblue.png';
          break;
          case 1:
          type =  'assets/images/ellipseyellow.png';
          break;
          
          case 2:
          type = 'assets/images/ellipseperpple.png';
          break;

          case 3:
          type = 'assets/images/ellipsegreen.png';
          break;

          default:
          "falha";
        }







                    if(_formKey.currentState!.validate()){

                    
       await data.setDailyTask(
        category: type,
        description: _textController.text,
        status: false.toString(),
        
        );
    }

    await data.readallData();
    Navigator.pop(context);
                   
                    
            },
            child: ButomSaveTask(index: select,)),
        ],
      ),
    );
  }
}

