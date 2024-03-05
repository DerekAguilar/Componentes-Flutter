// Definición de los temas de estilo de app
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Constante color primario
  static const primColor=Color.fromARGB(255, 141,114, 104);
  // Color primario oscurecido
  static const darkPrimColor=Color.fromARGB(255, 99, 80, 73);
  // Constante color secundario
  static const secColor=Color.fromARGB(255, 124, 124, 124);
  // Constante de color de fondo modo claro
  static const bgColorLight=Color.fromARGB(255, 228, 220, 220);
  // Constante de temas
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: bgColorLight,
    appBarTheme: AppBarTheme(
      foregroundColor: Colors.white,
      color: primColor,
      titleTextStyle: GoogleFonts.alice(
        fontSize: 28.0,
        fontWeight: FontWeight.bold
      ),
    ),
    iconTheme: const IconThemeData(
      color: primColor,
      size: 36.0
    ),
    elevatedButtonTheme:  ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor: MaterialStateProperty.all(primColor),
        textStyle: MaterialStateProperty.all(
          GoogleFonts.alice(
            fontSize: 24.0
          )
        ),
      )
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
      headlineMedium: GoogleFonts.acme(
        color:primColor,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
      ),
      // Estilo para texto pequeño
      bodySmall: GoogleFonts.alice(
        color:AppTheme.secColor,
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