import 'dart:math';

import 'package:flutter/cupertino.dart';


class GameProvider extends ChangeNotifier{
  int _kValue = 2;
  int _boardSize = 3;
  String _gameMode = 'Normal';
  bool _firstPlayer = false;
  bool _isPlaying = false;
  bool _autoPlay = false;
  bool _reload = false;
  List<String> _logs = [];

  List<List<int>> matrix = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0],
  ];

  void resetGame(){
    _isPlaying = false;
    _reload = false;
    _logs = [];
    matrix = List.generate(_boardSize, (_) => List.filled(_boardSize,0));
    notifyListeners();
  }

  void changeMatrixSize(int size){
    _boardSize = size;
    var r = new Random();
    matrix = List.generate(size, (_) => List.filled(size,r.nextInt(3)));
    notifyListeners();
  }

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

  List<String> get logs => _logs;

  set logs(List<String> value) {
    _logs = value;
    notifyListeners();
  }

  String get gameMode => _gameMode;

  set gameMode(String value) {
    _gameMode = value;
    notifyListeners();
  }

  int get boardSize => _boardSize;

  set boardSize(int value) {
    _boardSize = value;
    notifyListeners();
  }

  bool get autoPlay => _autoPlay;

  set autoPlay(bool value) {
    _autoPlay = value;
    notifyListeners();
  }
}