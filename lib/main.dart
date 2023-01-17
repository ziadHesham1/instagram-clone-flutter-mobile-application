import 'package:flutter/material.dart';
import 'package:instagram_clone/core/providers/users_provider.dart';
import 'package:instagram_clone/core/themes/app_themes.dart';
import 'package:provider/provider.dart';

import 'core/providers/comment_provider.dart';
import 'core/providers/posts_provider.dart';
import 'home_screen/home_screen.dart';
import 'home_screen/post_details_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /*  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {});
  } */

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
        ChangeNotifierProvider(
          create: (BuildContext context) => CommentsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Arabian Social Media',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
          ),
        ),
        routes: {
          '/': (context) => const HomeScreen(),
          PostDetailsScreen.routeName: (context) => const PostDetailsScreen(),
        },
      ),
    );
  }
}
