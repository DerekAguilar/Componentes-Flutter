import 'package:flutter/material.dart';
import 'package:practica3/theme/app_theme.dart';
import 'screens/home_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: AppTheme.darkTheme
    );
  }
}