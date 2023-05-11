import 'dart:math';

import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.lightBlue,
      child: Center(
        child: Text(
          generateLucyNumber(),
          textDirection: TextDirection.ltr,
          style: const TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
    );
  }

  String generateLucyNumber() {
    var random = Random();
    var nextInt = random.nextInt(10);
    return "Your lucky number is $nextInt";
  }
}
