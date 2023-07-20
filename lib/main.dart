import 'package:bolum26_flutter_pokedex_app/const/sabitler.dart';
import 'package:bolum26_flutter_pokedex_app/pages/anasayfa.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Sabitler.mainThemeData,
      debugShowCheckedModeBanner: false,
      title: 'Pokedex App',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Pokedex',
            style: Sabitler.appBarTitleTextStyle,
          ),
        ),
        body: Anasayfa(),
      ),
    );
  }
}
