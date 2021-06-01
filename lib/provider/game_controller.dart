import 'package:algoritmo_minimax/ai/globals.dart';
import 'package:flutter/cupertino.dart';

class GameController extends ChangeNotifier{
  String _gameMode = 'Normal';
  bool _startFirst = false;
  bool _isPlaying = false;
  bool _autoPlay = false;
  bool _isThinking = false;
  List<String> _logs = [];

  void resetGameUI(){
    _isPlaying = false;
    _logs = [];
    notifyListeners();
  }

  void changeMatrixSize(int size){
    //Board.BOARD_WITH = size;
    //board.board = List.generate(size, (_) => List.filled(size,Mark.BLANK));
    Globals.board = List.generate(size, (_) => List.filled(size,''));
    notifyListeners();
  }

  void setMaxDepth(int k){
    Globals.maxDepth = k;
    notifyListeners();
  }

  bool get startFirst => _startFirst;

  set startFirst(bool value) {
    _startFirst = value;
    notifyListeners();
  }

  bool get isPlaying => _isPlaying;

  set isPlaying(bool value) {
    _isPlaying = value;
    notifyListeners();
  }

  List<String> get logs => _logs;

  addLog(String log) {
    if(_isPlaying){
      _logs.add(log);
      notifyListeners();
    }
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

  bool get isThinking => _isThinking;

  set isThinking(bool value) {
    _isThinking = value;
    notifyListeners();
  }
}