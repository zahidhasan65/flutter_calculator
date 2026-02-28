
import 'package:flutter/material.dart';

import 'calculator_home.dart';
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      home:CalculatorHome() ,

    );

  }
}
