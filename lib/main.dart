


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictac/screens/gamescreen.dart';




main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
       home: GameScreen(),
    );
  }
}