import 'package:flutter/material.dart';
import 'package:instagram_clone/core/providers/users_provider.dart';
import 'package:provider/provider.dart';

import 'core/providers/posts_provider.dart';
import 'features/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => UsersProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => PostsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Arabian Social Media',
        routes: {'/': (context) => const HomeScreen()},
      ),
    );
  }
}
