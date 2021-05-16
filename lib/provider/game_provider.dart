import 'package:flutter/cupertino.dart';

class GameProvider extends ChangeNotifier{
  int _kValue = 2;
  bool _firstPlayer = false;
  bool _isPlaying = false;
  bool _reload = false;

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

  bool get reload => _reload;

  set reload(bool value) {
    _reload = value;
    notifyListeners();
  }

  bool get isPlaying => _isPlaying;

  set isPlaying(bool value) {
    _isPlaying = value;
    notifyListeners();
  }
}