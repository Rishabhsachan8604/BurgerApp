import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class TabBarChange extends ChangeNotifier {
  int index = 0;

  void changeIndex(int val) {
    index = val;
    notifyListeners();
  }
}

TabBarChange tabBarNotifier = TabBarChange();
