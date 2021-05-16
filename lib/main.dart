import 'dart:io';

import 'package:algoritmo_minimax/provider/panel_provider.dart';
import 'package:algoritmo_minimax/view/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('Sistemas Inteligentes');
    setWindowMinSize(const Size(500, 350));
    //setWindowMaxSize(Size.infinite);
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PanelProvider()),
      ],
      child: MaterialApp(
        title: 'Algoritmo Minimax',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Home()
      ),
    );
  }
}
