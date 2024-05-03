import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:task_app/components/tileCommitment.dart';
import 'package:task_app/constants/constants.dart';
import 'package:task_app/database/dbRepository.dart';

class CommitmentScreen extends StatefulWidget {
  const CommitmentScreen({super.key});

  @override
  State<CommitmentScreen> createState() => _CommitmentScreenState();
}

class _CommitmentScreenState extends State<CommitmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kbackground,

      appBar:  AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        title:  Text(
                      "Lista de Compromissos",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      fontFamily: "TitilliumWeb",
                    ),
                    
                    ),
      ),
      body: Column(
        children: [ 
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
               color: Kbackground,
               child: Consumer<DbRepository>(
                builder: (BuildContext ctx, dbrepository,__){
                  return ListView.builder(
                    itemCount: dbrepository.listCommitment.length,
                    itemBuilder: (BuildContext ctx, int index){ 
                        return TileCommitment(commitment: dbrepository.listCommitment[index]['description'], date: dbrepository.listCommitment[index]['date']);
                    });
                }),
            )),
        ],
      ),
    );
  }
}