import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static final appBarTitleTextStyle = GoogleFonts.monda(
    color: Colors.black,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );
  static final mainThemeData = ThemeData(
    primarySwatch: Colors.deepOrange,
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
    ),
  );
  static final pokeMainTextStyle =
      GoogleFonts.monda(fontSize: 16, fontWeight: FontWeight.w600);
  static final pokeDetailTitleTextStyle =
      GoogleFonts.monda(fontSize: 22, fontWeight: FontWeight.w600);
  static final pokeDetailNormaTextStyle =
      GoogleFonts.monda(fontSize: 20, fontWeight: FontWeight.w600);

  static final pokeMainBoxDeco = BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ));
  static final pokeDetailBoxDeco = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
  );
}
