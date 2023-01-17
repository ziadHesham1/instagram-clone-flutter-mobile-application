import 'package:flutter/material.dart';

import '../../../core/providers/comment_provider.dart';
import 'comment_widget.dart';

class CommentsWidget extends StatelessWidget {
  final List<CommentModel> commentsList;
  const CommentsWidget(this.commentsList, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Comments',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
            ),
          ),
          /*  Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: commentsList.length,
              itemBuilder: (context, index) {
                return Text(commentsList[index].commentContent);
              },
            ),
          ), */
          ...commentsList.map(
            (CommentModel comment) => CommentWidget(comment),
          ),
        ],
      ),
    );
  }
}
