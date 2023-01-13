import 'package:flutter/material.dart';

AppTheme currentTheme = AppTheme();

class AppTheme with ChangeNotifier {
  static const bool _isDarkTheme = true;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;
  void toggleTheme() {
    _isDarkTheme != _isDarkTheme;
    notifyListeners();
  }

  static get lightTheme {
    ThemeData(
    primaryColor: Colors.orange,
    backgroundColor: Colors.green,
    scaffoldBackgroundColor: Colors.grey,
    textTheme:const TextTheme(
      headline1: TextStyle(color: Colors.black),
      headline2: TextStyle(color: Colors.black),
      bodyText1: TextStyle(color: Colors.black),
      bodyText2: TextStyle(color: Colors.black),
    )
      
    );
  }
 static get darkTheme {
    ThemeData(
    primaryColor: Colors.black,
    backgroundColor: Colors.grey,
    scaffoldBackgroundColor: Colors.red,
    textTheme:const TextTheme(
      headline1: TextStyle(color: Colors.white),
      headline2: TextStyle(color: Colors.white),
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white),
    )
      
    );
  }
}
