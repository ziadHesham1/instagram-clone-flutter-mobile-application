import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/globals/global_variables.dart';
import '../../../core/globals/global_widgets/global_snackbar.dart';
import '../../../core/providers/posts_provider.dart';
import '../../../core/globals/global_widgets.dart';
import '../../../core/providers/users_provider.dart';
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
    print('PostInteractionWidget build method called');

    PostsProvider providedPosts = Provider.of<PostsProvider>(context);
    PostModel post = providedPosts.findPostById(widget.postId);
    UsersModel? loggedInUser =
        Provider.of<UsersProvider>(context).loggedInUser();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // likes buttons
          buildLikesButton(post),
          const SizedBox(width: 10),
          // comments button
          buildCommentButton(providedPosts, post, loggedInUser),
          // show comments button
          buildShowCommentButton(context, post)
        ],
      ),
    );
  }

  Widget buildLikesButton(PostModel post) {
    return TextButton.icon(
        icon: GlobalWidgets.like_icon,
        label: Text('${post.likesNumber}'),
        onPressed: () {});
  }
// replace it with the button with comment icon when new comment is ready

  Widget buildCommentButton(
      PostsProvider providedPosts, PostModel post, UsersModel? loggedInUser) {
    return TextButton.icon(
      icon: GlobalWidgets.comment_icon,
      label: Text('${post.comments.length}'),
      onPressed: () {
        setState(
          () {
            if (loggedInUser != null) {
              var commentContent2 =
                  '${post.userId} ${GlobalVariables.longText}';
              providedPosts.addComment(
                post.id,
                DateTime.now.toString(),
                loggedInUser.id,
                DateTime.now(),
                commentContent2,
              );
              GlobalSnackbar.show(context,
                  '${loggedInUser.name} added this comment : $commentContent2');
            } else {
              GlobalSnackbar.showWithLoginAction(
                context,
                'You need to login to add a comment!!',
              );
            }
          },
        );
      },
    );
  }

  Widget buildShowCommentButton(BuildContext context, PostModel post) {
    return TextButton(
        onPressed: () {
          setState(() {
            Navigator.of(context)
                .pushNamed(PostDetailsScreen.routeName, arguments: post);
          });
        },
        child: const Text('Show Comments'));
  }
}
