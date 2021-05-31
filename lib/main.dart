import 'dart:io';

import 'package:algoritmo_minimax/provider/game_provider.dart';
import 'package:algoritmo_minimax/test/globals.dart';
import 'package:algoritmo_minimax/view/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';
import 'model/Console.dart';

void main() {
  /*if(!kIsWeb){
    WidgetsFlutterBinding.ensureInitialized();
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      setWindowTitle('Taller Sistemas Inteligentes - Johan Ordenes - Dino Marín');
      setWindowMinSize(const Size(500, 350));
    }
  }
  Globals.initGlobals();
  runApp(MyApp());
   */
  Console console = new Console();
  console.play();

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GameProvider()),
      ],
      child: MaterialApp(
        title: 'Algoritmo Minimax',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Game()
      ),
    );
  }
}
