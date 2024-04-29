import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/database/dbRepository.dart';
import 'package:task_app/models/userModel.dart';
import 'package:task_app/screens/editProfile.dart';




class ProfileName extends StatelessWidget {
  const ProfileName({
    super.key,
   
  });

 
  @override
  Widget build(BuildContext context) {

    var dataUser = context.watch<DbRepository>().listProfile;

  var user = dataUser.map((e) => User.fromMap(e));
  
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        dataUser.isEmpty == true ? 
         Text("OLá,\n${'Name'}",
         style: TextStyle(
          
        height: 1,
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.w800,
                      fontFamily: "TitilliumWeb",
                    ),
        ) :  Text("OLá,\n${user.first.name}",
         style: TextStyle(
          
        height: 1,
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.w800,
                      fontFamily: "TitilliumWeb",
                    ),
        ),
        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => EditProfile()));
        }, icon: Icon(Icons.edit,
        color: Colors.grey,
        ))
      ],
    );
  }
}