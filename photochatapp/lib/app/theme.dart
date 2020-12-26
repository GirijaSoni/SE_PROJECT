import 'package:flutter/material.dart';

/// App Theme
///
/// {@category App Config}
ThemeData theme = ThemeData(
  primarySwatch: Colors.black54,
  scaffoldBackgroundColor: Colors.amber[50],
  inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      )),
  buttonTheme: ButtonThemeData(
      buttonColor: Color(0xff5a5a5c),
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      )),
);
