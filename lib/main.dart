import 'package:flutter/material.dart';

import 'features/screens/HomeScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      
      title: 'Arabian Social Media',
      routes: {
        '/':(context) =>const HomeScreen()
      },
    );
  }
}
