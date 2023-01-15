import 'package:flutter/material.dart';
import '../../../core/providers/comment_provider.dart';

import 'posts/comment/comments_widget.dart';

class PostDetailsScreen extends StatelessWidget {
  static String routeName = '/PostDetailsScreen_route';

  const PostDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<CommentModel> comments =
        ModalRoute.of(context)!.settings.arguments as List<CommentModel>;

    return CommentsWidget(comments);
  }
}
