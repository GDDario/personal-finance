import 'package:flutter/material.dart';

class MainMenuViewModel extends ChangeNotifier {
  bool expanded = true;

  void toggleExpanded() {
    expanded = !expanded;
    notifyListeners();
  }
}
