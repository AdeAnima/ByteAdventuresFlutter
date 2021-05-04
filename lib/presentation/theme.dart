import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData get byteAdventuresTheme => ThemeData(
      backgroundColor: const Color(0xFF111111),
      primaryColor: const Color(0xFF282C34),
      accentColor: const Color(0xFFFB1B50),
      brightness: Brightness.dark,
      buttonColor: const Color(0xFFAF1CFE),
      shadowColor: const Color(0xFFF54B26),
      scaffoldBackgroundColor: const Color(0xFF0F0F0F),
      textTheme: TextTheme(
        headline1: GoogleFonts.firaCode(textStyle: const TextStyle(fontSize: 48, letterSpacing: 3.0)),
        headline2: GoogleFonts.firaCode(
            textStyle: const TextStyle(fontSize: 36, fontWeight: FontWeight.w700, letterSpacing: 3.0)),
        headline3: GoogleFonts.firaCode(textStyle: const TextStyle(fontSize: 30, letterSpacing: 3.0)),
        headline4: GoogleFonts.firaCode(textStyle: const TextStyle(fontSize: 24, letterSpacing: 3.0)),
        headline5: GoogleFonts.firaCode(
            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, letterSpacing: 3.0)),
        headline6: GoogleFonts.firaCode(textStyle: const TextStyle(fontSize: 18, letterSpacing: 3.0)),
        bodyText1: GoogleFonts.firaCode(textStyle: const TextStyle(fontSize: 16)),
        bodyText2: GoogleFonts.firaCode(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
        caption: GoogleFonts.firaCode(textStyle: const TextStyle(fontSize: 12)),
      ),
    );
