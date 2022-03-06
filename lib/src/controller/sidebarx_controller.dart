import 'dart:async';

import 'package:flutter/material.dart';

class SidebarXController extends ChangeNotifier {
  SidebarXController({
    required int selectedIndex,
  }) : _selectedIndex = selectedIndex;

  int _selectedIndex;
  var _extended = false;

  final _extendedController = StreamController<bool>.broadcast();
  Stream<bool> get extendStream =>
      _extendedController.stream.asBroadcastStream();

  int get selectedIndex => _selectedIndex;
  void selectIndex(int val) {
    _selectedIndex = val;
    notifyListeners();
  }

  bool get extended => _extended;
  void toggleExtended() {
    _extended = !_extended;
    _extendedController.add(_extended);
    notifyListeners();
  }

  @override
  void dispose() {
    _extendedController.close();
    super.dispose();
  }
}
