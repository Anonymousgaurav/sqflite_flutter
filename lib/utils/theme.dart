import 'package:flutter/material.dart';
import 'package:ilaz/resources/ColorsRes.dart';

class IlazAppTheme {
  static ThemeData get theme {
    return ThemeData(
        brightness: Brightness.light,
        primaryColor: ColorsRes.primaryColor,
        buttonColor: ColorsRes.primaryColor,
        indicatorColor: ColorsRes.primaryColor,
        textSelectionColor: ColorsRes.primaryColor,
        accentColor: ColorsRes.primaryColor,
        canvasColor: ColorsRes.backgroundColor,
        textTheme: TextTheme(
          caption: TextStyle(color: ColorsRes.textTitleColor),
        ));
  }
}
