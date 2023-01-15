import 'package:flutter/material.dart';

import '../../../core/providers/comment_provider.dart';
import 'comment_widget.dart';

class CommentsWidget extends StatelessWidget {
  final List<CommentModel> commentsList;
  const CommentsWidget(this.commentsList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
      ),
      body: Column(
        children: [
          ...commentsList.map(
            (CommentModel comment) => CommentWidget(comment),
          ),
        ],
      ),

      /* ListView.builder(
        itemCount: commentsList.length,
        itemBuilder: (context, index) {
          return CommentWidget(commentsList[index]);
        },
      ), */
    );
  }
}
