import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/providers/comment_provider.dart';
import '../../core/providers/posts_provider.dart';
import '../../core/widgets/app_widgets.dart';

class PostInteractionWidget extends StatefulWidget {
  final String postId;
  const PostInteractionWidget(this.postId, {super.key});

  @override
  State<PostInteractionWidget> createState() => _PostInteractionWidgetState();
}

class _PostInteractionWidgetState extends State<PostInteractionWidget> {
  @override
  Widget build(BuildContext context) {
    var providedPosts = Provider.of<PostsProvider>(context);
    var post = providedPosts.findPostById(widget.postId);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // likes buttons
          AppWidgets.buildElevatedButton(
              AppWidgets.like_icon, '${post.likesNumber}', () {}),
          const SizedBox(width: 10),
          // comments button
          AppWidgets.buildElevatedButton(
              AppWidgets.comment_icon, '${post.comments.length}', () {
            setState(
              () {
                providedPosts.addComment(
                  post.id,
                  CommentModel(
                    id: DateTime.now.toString(),
                    commentPublisherId: post.id,
                    commentPublishTime: DateTime.now(),
                    commentContent: '${post.userName}You are so cool',
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
