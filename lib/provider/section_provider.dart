import 'package:flutter/cupertino.dart';
import 'package:personal_finance/model/section.dart';

import '../data/sections.dart';

class SectionProvider extends ChangeNotifier {
  Section _section = sections[0];

  Section get section => _section;

  void changeSection(Section section) {
    _section = section;

    notifyListeners();
  }
}