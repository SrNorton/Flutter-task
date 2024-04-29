import 'dart:io';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:task_app/components/genericButton.dart';

import 'package:task_app/constants/constants.dart';
import 'package:task_app/database/dbRepository.dart';



class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _textController = TextEditingController();

final imagePicker = ImagePicker();
File? imageFile;

pick(ImageSource source) async {
  final pickedFile = await imagePicker.pickImage(source: source);

  if(pickedFile != null) {
    setState(() {
      imageFile = File(pickedFile.path);
    });
  }
}

Uint8List convertImageToBytes(File image) {
  final file = File(image.path);
  return file.readAsBytesSync();
}






  @override
  Widget build(BuildContext context) {


       var data = context.read<DbRepository>();


    

      
    


       

    return Scaffold(
      backgroundColor: Kbackground,
      appBar: AppBar(
         iconTheme: IconThemeData(
color: Colors.white
        ),
             backgroundColor:   Colors.transparent,
         
        title: Text('Edit Profile',
        style: TextStyle(
                
              height: 1,
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            fontFamily: "TitilliumWeb",
                          ),
        ),
      ),
      body: Column( 
        
            crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          
           Padding(
             padding: const EdgeInsets.only(top: 40),
             child: SizedBox(
              height: 200,
              width: 200,
               child: CircleAvatar( 
                         backgroundColor: Colors.grey[200],
                         backgroundImage: imageFile != null ? FileImage(imageFile!) : null,
                         child: imageFile == null ?  Icon(Icons.person,
                         size: 90,
                         ) : null
                       ),
             ),
           ),
           SizedBox(height: 55,),
           Center(
            
             child: Container(
              height: 460,
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration( 
                borderRadius: BorderRadius.circular(20),
                color: Colors.white70
              ),
               child: Padding(
                 padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                 child: Column(
                   children: [
                            Form(
                            key: _formKey,
                            child: TextFormField( 
                              validator: (value){
                                if(value == null || value.isEmpty){return 'Insert your Name';}
                                if(value.length > 8){return 'O nome deve ter 8 caracteres';}
                                
                              return null;
                              },
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
                          ),




                     SizedBox(height: 30,),
                     GenericButton(title: 'Câmera', icon: Icons.camera_alt, function: (){pick(ImageSource.camera);},),
                     SizedBox(height: 30,),
                     GenericButton(title: 'Galeria', icon: Icons.image, function: (){pick(ImageSource.gallery);},),
                     SizedBox(height: 30,),
                     GenericButton(title: 'Remover', icon: Icons.delete, function: (){setState(() {
                       imageFile = null;
                     });},),
                     SizedBox(height: 30,),
                     
                     
                     
                     GenericButton(title: 'Salvar', icon: Icons.save, function: (){
                     
                      
                       if(_formKey.currentState!.validate()){
                           
                      if(imageFile != null){
                        var image = convertImageToBytes(imageFile!);

                        data.setProfile(
                          name: _textController.text,
                          image: image,
                        );

                        data.readProfile();

                      } 


                       }


                     }, 
                     color: Colors.blue,
                     )

                     
                     
                   ],
                 ),
               ),
             ),
           ),
        ]
       
      ),
    );
  }
}

