import 'package:flutter/material.dart';
import 'package:instagram_clone/core/providers/users_provider.dart';
import 'package:instagram_clone/core/globals/global_widgets/app_snackbar.dart';
import 'package:provider/provider.dart';

import '../../../core/globals/global_variables.dart';
import '../../../core/providers/comment_provider.dart';
import '../../../core/providers/posts_provider.dart';
import '../../../core/globals/global_widgets.dart';
import '../../post_details_screen.dart';

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
    var loggedInUser = Provider.of<UsersProvider>(context).loggedInUser();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // likes buttons

          TextButton.icon(
              icon: GlobalWidgets.like_icon,
              label: Text('${post.likesNumber}'),
              onPressed: () {}),

          const SizedBox(width: 10),
          // comments button

          TextButton.icon(
              icon: GlobalWidgets.comment_icon,
              label: Text('${post.comments.length}'),
              onPressed: () {
                setState(
                  () {
                    if (loggedInUser != null) {
                      var commentContent2 = '${post.userId}You are so cool';
                      providedPosts.addComment(
                        post.id,
                        CommentModel(
                          id: DateTime.now.toString(),
                          userId: loggedInUser.id,
                          publishTime: DateTime.now(),
                          commentContent: commentContent2,
                        ),
                      );
                      GlobalSnackbar.show(context,
                          '${loggedInUser.name} added this comment : $commentContent2');
                    } else {
                      GlobalSnackbar.showWithAction(
                        context,
                        'You need to login to add a comment!!',
                        'LOGIN',
                        () {
                          GlobalVariables.homeScaffoldKey.currentState!
                              .openDrawer();
                        },
                      );
                    }
                  },
                );
              }),

          TextButton(
              onPressed: () {
                setState(() {
                  Navigator.of(context).pushNamed(PostDetailsScreen.routeName,
                      arguments: post.comments);
                });
              },
              child: const Text('Show Comments'))
        ],
      ),
    );
  }

  void buildSnackBar(ctx, String content) {
    ScaffoldMessenger.of(ctx).hideCurrentSnackBar();
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text(content),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(label: 'LOGIN', onPressed: () {}),
      ),
    );
  }
}
