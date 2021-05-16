import 'package:flutter/cupertino.dart';

class PanelProvider extends ChangeNotifier{
  int _kValue = 2;
  bool _firstPlayer = false;

  int get kValue => _kValue;

  set kValue(int value) {
    _kValue = value;
    notifyListeners();
  }

  bool get firstPlayer => _firstPlayer;

  set firstPlayer(bool value) {
    _firstPlayer = value;
    notifyListeners();
  }
}