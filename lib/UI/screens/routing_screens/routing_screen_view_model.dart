import 'package:flutter/material.dart';

class BottomNavigationViewModel extends ChangeNotifier {
  int _index = 0;
  int get index => _index;

  setState(int index) {
    _index = index;
    notifyListeners();
  }
}
