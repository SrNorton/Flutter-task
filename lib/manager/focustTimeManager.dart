import 'package:flutter/material.dart';

class FocusTimeManager extends ChangeNotifier {
    int _timer = 0;

    int get timefocus{
      return _timer;
    }


    addTimer(){
      _timer ++;
      notifyListeners();
    }

    removeTimer(){
      _timer --;
      notifyListeners();
    }
}