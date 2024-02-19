// Definición de los temas de estilo de app
import 'package:flutter/material.dart';

class AppTheme {
  // Constante color primario
  static const primColor=Color.fromARGB(255, 141,114, 104);
  // Constante de color de fondo modo claro
  static const bgColorLight=Color.fromARGB(255, 228, 220, 220);
  // Constante de color de fondo modo oscuro
  static const bgColorDark=Color.fromARGB(255, 67, 50, 50);
  // Constante de temas
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: bgColorLight,
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white,
      color: primColor
    )
  );
  static final ThemeData darkTheme= ThemeData.dark().copyWith(
    scaffoldBackgroundColor: bgColorDark,
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white,
      color: primColor
    )
  );
}