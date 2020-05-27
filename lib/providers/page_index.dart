import 'package:flutter/material.dart';

class PageIndex with ChangeNotifier {
  int _selectedIndex = 0;

  int getPageIndex() {
    int index = _selectedIndex;
    return index;
  }

  void changePage(int newIndex) {
    _selectedIndex = newIndex;
    notifyListeners();
  }
}
