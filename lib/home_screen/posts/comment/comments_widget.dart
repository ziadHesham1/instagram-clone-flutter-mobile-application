import 'package:flutter/material.dart';

import '../../../core/globals/global_variables.dart';
import '../../../core/providers/comment_provider.dart';
import 'comment_widget.dart';

class CommentsWidget extends StatelessWidget {
  final List<CommentModel> commentsList;
  const CommentsWidget(this.commentsList, {super.key});

  @override
  Widget build(BuildContext context) {
    print('CommentsWidget build method called');

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Comments (${commentsList.length})',
              style: GlobalVariables.subTitleTextStyle,
            ),
          ),
          ...commentsList.map(
            (CommentModel comment) => CommentWidget(comment),
          ),
        ],
      ),
    );
  }
}
