// Definición de los temas de estilo de app
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Constante color primario
  static const primColor=Color.fromARGB(255, 141,114, 104);
  // Constante color secundario
  static const secColor=Color.fromARGB(255, 124, 124, 124);
  // Constante de color de fondo modo claro
  static const bgColorLight=Color.fromARGB(255, 228, 220, 220);
  // Constante de temas
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: bgColorLight,
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white,
      color: primColor
    ),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.acme(
        color:primColor,
        fontSize:28.0,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        decoration: TextDecoration.underline,
        decorationColor: AppTheme.secColor,
        decorationStyle: TextDecorationStyle.dashed,
        decorationThickness: 4.0
      ),
      // Estilo para texto pequeño
      bodySmall: GoogleFonts.alice(
        color:secColor,
        fontSize: 16.0
      )
    )
  );
  static final ThemeData darkTheme= ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white,
      color: primColor
    ),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.acme(
        color:primColor,
        fontSize:24,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic,
      ),
    )
  );
}