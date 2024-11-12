import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/home_screen.dart';

void main() {
  runApp(TicTacToeApp());
}

class TicTacToeApp extends StatefulWidget {
  const TicTacToeApp({super.key});

  @override
  State<TicTacToeApp> createState() => _TicTacToeAppState();
}

class _TicTacToeAppState extends State<TicTacToeApp> {
  @override
  Widget build(BuildContext context) {
    return getMaterial();
  }
}

Widget getMaterial(){
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'dana'
    ),
    home: HomeScreen(),
  );
}