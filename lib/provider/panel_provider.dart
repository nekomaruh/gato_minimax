import 'package:flutter/cupertino.dart';

class PanelProvider extends ChangeNotifier{
  int _kValue = 2;

  int get kValue => _kValue;

  set kValue(int value) {
    _kValue = value;
    notifyListeners();
  }
}