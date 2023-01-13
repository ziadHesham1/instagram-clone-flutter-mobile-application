import 'package:flutter/material.dart';
import 'package:instagram_clone/home_screen/posts/comment/comment_widget.dart';

import '../core/providers/comment_provider.dart';

class PostDetailsScreen extends StatelessWidget {
  static String routeName = '/PostDetailsScreen_route';

  const PostDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<CommentModel> comments =
        ModalRoute.of(context)!.settings.arguments as List<CommentModel>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
      ),
      body: ListView.builder(
        itemCount: comments.length,
        itemBuilder: (context, index) {
          return CommentWidget(comments[index]);
        },
      ),
    );
  }
}
