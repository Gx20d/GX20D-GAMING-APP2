import 'package:flutter/material.dart';
import 'navigation/navigation.dart';

void main() {
  runApp(const GX20DGamingApp());
}

class GX20DGamingApp extends StatelessWidget {
  const GX20DGamingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GX20D Gaming',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      home: const NavigationScreen(),
    );
  }
}