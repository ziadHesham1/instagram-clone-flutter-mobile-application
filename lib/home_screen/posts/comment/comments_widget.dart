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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Comments',
              style: GlobalVariables.sectionTitleTextStyle,
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
