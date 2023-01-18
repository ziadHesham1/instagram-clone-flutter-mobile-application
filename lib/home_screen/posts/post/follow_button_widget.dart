import 'package:flutter/material.dart';
import 'package:instagram_clone/core/globals/global_widgets/global_snackbar.dart';
import 'package:provider/provider.dart';

import '../../../core/globals/global_widgets.dart';
import '../../../core/providers/users_provider.dart';

class FollowButtonWidget extends StatefulWidget {
  final String userId;
  const FollowButtonWidget(this.userId, {super.key});

  @override
  State<FollowButtonWidget> createState() => _FollowButtonWidgetState();
}

class _FollowButtonWidgetState extends State<FollowButtonWidget> {
  bool isFollowed = false;

  @override
  Widget build(BuildContext context) {
    // var post = Provider.of<PostsProvider>(context).findPostById(widget.postId);
    var userProvider = Provider.of<UsersProvider>(context);
    var loggedInUser = userProvider.loggedInUser();

    if (loggedInUser != null && loggedInUser.id != widget.userId) {
      isFollowed = userProvider.isContaining(loggedInUser.id, widget.userId);
      return TextButton.icon(
        onPressed: () {
          setState(() {
            userProvider.follow(loggedInUser.id, widget.userId);
            GlobalSnackbar.show(
                context, '${loggedInUser.name} followed ${widget.userId}');
          });
        },
        icon: isFollowed
            ? GlobalWidgets.following_icon
            : GlobalWidgets.follow_icon,
        label: Text(isFollowed ? 'Following' : 'Follow'),
      );
    } else {
      return const SizedBox(
        height: 10,
        width: 10,
      );
    }
  }
}
