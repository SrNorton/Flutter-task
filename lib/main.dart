import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/database/dbRepository.dart';
import 'package:task_app/manager/focustTimeManager.dart';
import 'package:task_app/manager/timeManager.dart';


import 'package:task_app/screens/pageView.dart';


void main() {
  
  runApp(
    
    MultiProvider(
      
      providers: [
        ChangeNotifierProvider(create: (_) => DbRepository(),lazy: false,),
        ChangeNotifierProvider(create: (_) => TimeProvider(), lazy: false,),
        ChangeNotifierProvider(create: (_) => FocusTimeManager(),),
      ],
      
      child: const MyApp()
      
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    context.read<DbRepository>().readCommitment();
    

    

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

