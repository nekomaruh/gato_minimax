import 'dart:io';

import 'package:algoritmo_minimax/provider/game_provider.dart';
import 'package:algoritmo_minimax/view/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';

void main() {
  if(!kIsWeb){
    WidgetsFlutterBinding.ensureInitialized();
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      setWindowTitle('Taller Sistemas Inteligentes - Johan Ordenes - Dino Marín');
      setWindowMinSize(const Size(500, 350));
    }
  }
  runApp(MyApp());
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
          primarySwatch: Colors.deepOrange,
        ),
        home: Home()
      ),
    );
  }
}
