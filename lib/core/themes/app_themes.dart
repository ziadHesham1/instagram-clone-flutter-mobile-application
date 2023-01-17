import 'package:flutter/material.dart';

ThemeData newMethod() {
  return ThemeData(
      // primarySwatch: Colors.white,

      /*   appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        // ignore: prefer_const_constructors
        textButtonTheme: TextButtonThemeData(
            style: const ButtonStyle(
          // backgroundColor: MaterialStatePropertyAll(Colors.white),
          foregroundColor: MaterialStatePropertyAll(Colors.black),
        )),
       */
      );
}


/* AppThemes currentTheme = AppThemes();

class AppThemes {
  static const bool _isDarkTheme = true;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;
  void toggleTheme() {
    _isDarkTheme != _isDarkTheme;
    // notifyListeners();
  }

  get myTheme {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      // ignore: prefer_const_constructors
      textButtonTheme: TextButtonThemeData(
          style: const ButtonStyle(
        // backgroundColor: MaterialStatePropertyAll(Colors.white),
        foregroundColor: MaterialStatePropertyAll(Colors.black),
      )),
    );
  }

 static ThemeData lightTheme() {
    return ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange)
            .copyWith(secondary: Colors.blueGrey));
  } 

  static get darkTheme {
    ThemeData(
        primaryColor: Colors.black,
        backgroundColor: Colors.grey,
        scaffoldBackgroundColor: Colors.red,
        textTheme: const TextTheme(
          headline1: TextStyle(color: Colors.white),
          headline2: TextStyle(color: Colors.white),
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ));
  }
}
 */