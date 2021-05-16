import 'package:flutter/material.dart';

abstract class GameInterface {
  play(BuildContext context, {bool randomPlay = false});
  reload(BuildContext context);
}