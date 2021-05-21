import 'package:flutter/material.dart';

abstract class GameInterface {
  void play(BuildContext context, {bool randomPlay = false});
  void reload(BuildContext context);
}