import 'package:flutter/material.dart';
import 'dart:io';

import 'package:reverse_macro_calculator/screens/home.dart';

void main() => runApp(ReverseMacroCalculatorApp());

class ReverseMacroCalculatorApp extends StatefulWidget {
  @override
  _ReverseMacroCalculatorAppState createState() => _ReverseMacroCalculatorAppState();
}

class _ReverseMacroCalculatorAppState extends State<ReverseMacroCalculatorApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}




//servingSizeTotal = macroTotal*(servingSize/servingMacro)
