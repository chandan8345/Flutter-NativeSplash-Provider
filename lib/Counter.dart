import 'package:flutter/cupertino.dart';

class Counter extends ChangeNotifier {
  var count = 0;
  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count > 0 ? count-- : "";
    notifyListeners();
  }

  int get getCounter{
    return count;
  }
}
