import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          colorScheme: const ColorScheme(
              primary: Colors.pink,
              secondary: Colors.purple,
              brightness: Brightness.dark,
              onPrimary: Colors.amber,
              onSecondary: Colors.white,
              error: Colors.red,
              onError: Colors.black,
              background: Colors.blue,
              onBackground: Color(0xFF0A0E21),
              surface: Color(0xFF0A0E21),
              onSurface: Color.fromARGB(255, 255, 255, 255)),
          scaffoldBackgroundColor: const Color(0xFF0A0E21),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          )),
      home: const InputPage(),
    );
  }
}
