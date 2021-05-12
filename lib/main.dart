import 'package:flutter/material.dart';

main() {
  runApp(new MaterialApp(
    home: HalamanAwal(),
  ));
}

class HalamanAwal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.blue[200],
      width: 200.0,
      height: 100.0,
      child: Center(
          child: Text(
        "data",
        style: TextStyle(color: Colors.white12),
      )),
    ));
  }
}
