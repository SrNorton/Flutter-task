import 'package:flutter/material.dart';

class TimeProvider extends ChangeNotifier{

    int _hours = 12;
    int _minutes = 30;


    int get hours{
      return _hours;
    }
    
    int get minutes{
      return _minutes;
    }


    addHours(){
      _hours ++;
      notifyListeners();
    }

    removeHours(){
      _hours --;
      notifyListeners();
    }

    addMinutes(){
      _minutes ++;
      notifyListeners();
    }

    removeMinutes(){
      _minutes --;
      notifyListeners();
    }

}