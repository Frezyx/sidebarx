import 'package:flutter/material.dart';

class SidebarXController extends ChangeNotifier {
  SidebarXController({
    required int selectedIndex,
  }) : _selectedIndex = selectedIndex;

  int _selectedIndex;
  var _extended = false;

  int get selectedIndex => _selectedIndex;
  void selectIndex(int val) {
    _selectedIndex = val;
    notifyListeners();
  }

  bool get extended => _extended;
  void toggleExtended() {
    _extended = !_extended;
    notifyListeners();
  }
}
