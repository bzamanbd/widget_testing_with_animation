import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'animated widget test',
    theme: ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.purple,
    ),
    home: const HomeScreen(),
  ));
}
