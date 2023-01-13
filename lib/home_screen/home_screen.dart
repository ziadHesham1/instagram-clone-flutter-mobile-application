import 'package:flutter/material.dart';

import 'new_post/new_post_widget.dart';
import 'posts/post/posts_view_widget.dart';
import 'status/status_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key, 
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arabian Social Media'),
      ),
      body: SingleChildScrollView(
        child: Column(
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
