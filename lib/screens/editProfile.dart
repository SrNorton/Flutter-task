import 'dart:io';

import 'package:daily_task/components/genericButton.dart';
import 'package:daily_task/components/nameTextField.dart';
import 'package:daily_task/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

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






  @override
  Widget build(BuildContext context) {
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
              height: 400,
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration( 
                borderRadius: BorderRadius.circular(20),
                color: Colors.white70
              ),
               child: Padding(
                 padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                 child: Column(
                   children: [
                     NameTextField(),
                     SizedBox(height: 30,),
                     GenericButton(title: 'Câmera', icon: Icons.camera_alt, function: (){pick(ImageSource.camera);},),
                     SizedBox(height: 30,),
                     GenericButton(title: 'Galeria', icon: Icons.image, function: (){pick(ImageSource.gallery);},),
                     SizedBox(height: 30,),
                     GenericButton(title: 'Remover', icon: Icons.delete, function: (){setState(() {
                       imageFile = null;
                     });},),
                     
                     
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

