import 'package:flutter/material.dart';

class Tutorial extends StatelessWidget {
  const Tutorial({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Como Jugar?'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Marca las opciones que desees en la lista de opciones a la derecha'),
          SizedBox(height: 20,),
          Text('Haz click en iniciar')
        ],
      ),
    );
  }
}
