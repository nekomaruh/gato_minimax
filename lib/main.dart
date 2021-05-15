import 'package:algoritmo_minimax/provider/panel_provider.dart';
import 'package:algoritmo_minimax/view/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
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
          primarySwatch: Colors.red,
        ),
        home: Home()
      ),
    );
  }
}
