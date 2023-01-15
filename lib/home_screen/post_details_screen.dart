import 'package:flutter/material.dart';
import '../../../core/providers/comment_provider.dart';

import '../core/providers/posts_provider.dart';
import 'posts/comment/comments_widget.dart';
import 'posts/post/post_widget.dart';

class PostDetailsScreen extends StatelessWidget {
  static String routeName = '/PostDetailsScreen_route';

  const PostDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PostModel post = ModalRoute.of(context)!.settings.arguments as  PostModel; 
    List<CommentModel> comments = post.comments;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Post Details'),
        ),
        body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        PostWidget(post.id),
        CommentsWidget(comments),
      ],
      ),
    );
  }
}
 

