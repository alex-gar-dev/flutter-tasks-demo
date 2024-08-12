import 'package:flutter/material.dart';
import 'uxds_colors.dart';

class UXDSTextStylesApp {
  static TextStyle primaryText = const TextStyle(
    fontFamily: 'Popins',
    color: UXDSColorApp.primaryWhite
  );

  static TextStyle secondaryText = const TextStyle(
    fontFamily: 'Popins',
    color: UXDSColorApp.primaryBlack
  );

  static TextStyle ternaryText = const TextStyle(
    fontFamily: 'Popins',
    color: Color.fromARGB(255, 131, 131, 131)
  );
}