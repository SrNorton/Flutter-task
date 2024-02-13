import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:task_app/constants/constants.dart';
import 'package:task_app/screens/calendar.dart';
import 'package:task_app/screens/homeScreen.dart';

class PageManagerState extends StatefulWidget {
  const PageManagerState({super.key});

  @override
  State<PageManagerState> createState() => __PageManagerStateState();
}

class __PageManagerStateState extends State<PageManagerState> {
  int startPage = 0;
  late PageController pc;

  @override
  void initState() {
    
    super.initState();
    pc = PageController(initialPage: startPage);
  }

  setPage(index){
    setState(() {
      startPage = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView(
        controller: pc,
        children: [
          HomePage(),
          Calendar(),
        ],
        onPageChanged: setPage,
      ),
       extendBody: true,
      
      bottomNavigationBar: CircleNavBar(
        
        activeIcons: const [
          Icon(Icons.home, color: Colors.white),
          
          Icon(Icons.calendar_month_outlined, color: Colors.white),

          
        ],
        inactiveIcons: const [
          Text("Home",
          style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
          ),
          Text("Calendar",
          style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
          ),
          
        ],
        color: Colors.white,
        height: 60,
        circleWidth: 60,
        activeIndex: startPage,
        onTap: (index) {
         pc.animateToPage(index, duration: Duration(milliseconds: 400), curve: Curves.ease);
        },
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        shadowColor: Color.fromARGB(255, 63, 6, 128),
         
        circleShadowColor: Colors.white,
        elevation: 10,
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [ KbutonColor, const Color.fromARGB(255, 30, 105, 233) ],
        ),
        circleGradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [ KbutonColor, Colors.greenAccent ],  
        ),
      
      ),
    );
  }
}