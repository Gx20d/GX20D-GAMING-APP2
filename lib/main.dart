import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() {
  runApp(const GX20DApp());
}

class GX20DApp extends StatelessWidget {
  const GX20DApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GX20D Gaming',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}