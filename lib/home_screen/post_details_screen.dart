import 'package:flutter/material.dart';
import 'package:instagram_clone/home_screen/posts/comment/comment_widget.dart';

import '../core/providers/comment_provider.dart';
import 'posts/comment/comments_widget.dart';

class PostDetailsScreen extends StatelessWidget {
  static String routeName = '/PostDetailsScreen_route';

  const PostDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommentsWidget();
  }
}
