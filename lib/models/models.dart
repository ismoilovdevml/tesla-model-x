import 'package:flutter/material.dart';

//State of the Bottom Buttons//
class BottomButtonModel extends ChangeNotifier {
  int _number = 0;
  bool _charging = false;

  int get number => _number;

  set number(int number) {
    _number = number;
    notifyListeners();
  }

  bool get charging => _charging;

  set charging(bool value) {
    _charging = value;
    notifyListeners();
  }
}

class StatsModel extends ChangeNotifier {
  bool _start = false;

  bool get start => _start;

  set start(bool value) {
    _start = value;
    notifyListeners();
  }
}