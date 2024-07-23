import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer([
          Color.fromARGB(255, 164, 65, 65),
          Color.fromARGB(137, 96, 22, 22),
        ]),
      ),
    ),
  );
}
