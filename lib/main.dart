import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/database/dbrepository.dart';

import 'package:task_app/screens/pageView.dart';


void main() {
  
  runApp(
    
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=> DbRepository()),
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      
     
       fontFamily: "TitilliumWeb",
        useMaterial3: true,
      ),
      home:  PageManagerState(),
    );
  }
}

