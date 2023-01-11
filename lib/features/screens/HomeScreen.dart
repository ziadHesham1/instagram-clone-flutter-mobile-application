import 'package:flutter/material.dart';
import 'package:instagram_clone/core/providers/posts_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/new_post_widget.dart';
import '../widgets/posts_view_widget.dart';
import '../widgets/status_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => PostsProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Arabian Social Media'),
        ),
        body: Column(
          children: const [
            Status(),
            NewPost(),
            SizedBox(
              height: 20,
            ),
            PostsView(),
          ],
        ),
      ),
    );
  }
}
