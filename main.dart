import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const GX20DApp());
}

class GX20DApp extends StatelessWidget {
  const GX20DApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GX20D Gaming',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}