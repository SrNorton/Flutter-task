import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/components/buttonShoppingList.dart';
import 'package:task_app/database/dbRepository.dart';

class TextFormShoppingList extends StatefulWidget {
  const TextFormShoppingList({super.key});

  @override
  State<TextFormShoppingList> createState() => _TextFormShoppingListState();
}

class _TextFormShoppingListState extends State<TextFormShoppingList> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _textController = TextEditingController();






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
                  if(value == null || value.isEmpty){return 'Insert one Item';}
                  if(value.length > 25){return 'Give a shorter description';}
                  
                return null;
                },
                
                decoration: InputDecoration(
                  
                  hintText: 'add your Item',
                  border: OutlineInputBorder(
                    
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              ),
            ),
          ),
          SizedBox(height: 25,),
          
          //Botão

          ButtonShoppingList(
            function: ()async {

                    if(_formKey.currentState!.validate()){

                    
       await data.setShoppingList(
        item: _textController.text,
        status: false.toString()
       );
    } else {return null;}
    // await data.deleteData();

    await data.readListShopping();
    Navigator.pop(context);
            },
          ),

         
        
        ],
      ),
    );
  }
}

