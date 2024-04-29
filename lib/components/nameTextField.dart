import 'package:flutter/material.dart';

class NameTextField extends StatefulWidget {
  
  
   NameTextField({
    super.key,
  });

  @override
  State<NameTextField> createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {


final _formKey = GlobalKey<FormState>();
  TextEditingController _textController = TextEditingController();










  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField( 
        
        controller: _textController,
           decoration: InputDecoration(
             labelText: 'Name',
             fillColor: Colors.blue,
             hintText: 'Your first name',
             border: OutlineInputBorder(
               
               borderRadius: BorderRadius.circular(20)
             )
           ),
      ),
    );
  }
}