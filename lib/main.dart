import 'package:flutter/material.dart';
import 'package:flutter_assignment1/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'poppins'),
      home: const MyHome()
    );
  }
}