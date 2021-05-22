import 'package:algoritmo_minimax/model/board.dart';
import 'package:algoritmo_minimax/model/mark.dart';
import 'package:flutter/cupertino.dart';

class GameProvider extends ChangeNotifier{
  int _kValue = 2;
  String _gameMode = 'Normal';
  bool _firstPlayer = false;
  bool _isPlaying = false;
  bool _autoPlay = false;
  List<String> _logs = [];
  Board board = new Board();

  void resetGameUI(){
    _isPlaying = false;
    _logs = [];
    board.board = List.generate(Board.BOARD_WITH, (_) => List.filled(Board.BOARD_WITH,Mark.BLANK));
    notifyListeners();
  }

  void changeMatrixSize(int size){
    Board.BOARD_WITH = size;
    board.board = List.generate(size, (_) => List.filled(size,Mark.BLANK));
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

  bool get autoPlay => _autoPlay;

  set autoPlay(bool value) {
    _autoPlay = value;
    notifyListeners();
  }
}