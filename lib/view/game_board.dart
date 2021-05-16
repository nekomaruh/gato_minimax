import 'package:flutter/material.dart';

class GameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<int> matrix = [0, 0, 0, 1, 0, 2, 2, 0, 0];
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.all(15),
        itemCount: matrix.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              elevation: 0,
              color: matrix[index] == 0
                  ? Colors.blueGrey[200]
                  : matrix[index] == 1
                  ? Colors.blue[200]
                  : Colors.red[200],
              // ignore: unrelated_type_equality_checks
              child: Center(
                  child: matrix[index] == 0
                      ? Container()
                      : matrix[index] == 1
                      ? Icon(
                    Icons.close,
                    size: 60,
                    color: Colors.blue,
                  )
                      : Icon(
                    Icons.circle,
                    size: 50,
                    color: Colors.red,
                  )));
        });
  }
}