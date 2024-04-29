



import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/database/dbRepository.dart';
import 'package:task_app/models/userModel.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
     super.key,
  });

 

  @override
  Widget build(BuildContext context) {

 var dataUser = context.watch<DbRepository>().listProfile;

  var user = dataUser.map((e) => User.fromMap(e));

  convertToUint8List(List<int> bytes){
      
     Uint8List imageBytes =  Uint8List.fromList(bytes);
     return  imageBytes;

  }


  List<int>teste(){
    if(dataUser.isEmpty == false){
      return user.first.imagem;
    } else {
      return [];
    }
  }


  List<int> listBytes =  teste();
  

  
 final imageBytes =  listBytes == [] ? null : convertToUint8List(listBytes);





ImageProvider imageProvider = MemoryImage(imageBytes!);












    return Row(
     mainAxisAlignment: MainAxisAlignment.start,
      children: [
    
       //image profile
        CircleAvatar(
         radius: 45,
         backgroundColor: Colors.grey[200],
         backgroundImage: dataUser.isEmpty == true ? null : imageProvider,
         child: dataUser.isEmpty == true ?  Icon(Icons.person,
                  size: 90,
                  ) : null
         
        ),
       
      ],
    );
  }
}

