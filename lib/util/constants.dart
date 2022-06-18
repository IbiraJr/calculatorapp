import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Constants {
  static const TextStyle calculatorStyle = TextStyle(
    color: Colors.black,
  );
  static bool isMobile = (kIsWeb &&
          (defaultTargetPlatform == TargetPlatform.iOS ||
              defaultTargetPlatform == TargetPlatform.android)) ||
              defaultTargetPlatform == TargetPlatform.iOS ||
              defaultTargetPlatform == TargetPlatform.android;
      
  static const List<String> buttons = [
    'Rad | Deg',
    'x!',
    '(',
    ')',
    '%',
    'AC',
    'Inv',
    'sin',
    'ln',
    '7',
    '8',
    '9',
    '÷',
    'π',
    'cos',
    'log',
    '4',
    '5',
    '6',
    'x',
    'e',
    'tan',
    '√',
    '1',
    '2',
    '3',
    '-',
    'Ans',
    'EXP',
    'x^y',
    '0',
    '.',
    '=',
    '+',
  ];
}
