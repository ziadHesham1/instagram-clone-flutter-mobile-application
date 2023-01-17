import 'package:flutter/material.dart';
import 'package:instagram_clone/core/globals/global_widgets/app_snackbar.dart';

import 'package:provider/provider.dart';

import '../../../core/globals/global_variables.dart';
import '../../../core/providers/posts_provider.dart';
import '../../../core/providers/users_provider.dart';
import '../../../core/globals/global_widgets.dart';
import '../../post_details_screen.dart';
import 'post_interaction_widget.dart';

class PostWidget extends StatefulWidget {
  final String postId;
  const PostWidget(this.postId, {super.key});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

// bool b = false;

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    var post = Provider.of<PostsProvider>(context).findPostById(widget.postId);
    var userProvider = Provider.of<UsersProvider>(context);
    var user = userProvider.findUserById(post.userId);
    var postPublishTime =
        DateTime.now().difference(post.postPublishTime).inMinutes.toString();

    return InkWell(
      onTap: () {
        setState(() {
          Navigator.of(context)
              .pushNamed(PostDetailsScreen.routeName, arguments: post);
        });
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        // padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(GlobalVariables.postBorderRadius),
          border: Border.all(color: GlobalVariables.post_border_color),
        ),
        width: double.infinity,
        child: Column(
          children: [
            ListTile(
              // post publisher profile picture
              leading: CircleAvatar(
                backgroundImage: AssetImage(user.imgPath),
              ),
              // post publisher user name
              title: Text(user.name),

              // post date
              subtitle: Text('$postPublishTime min'),
              // follow button
              trailing: buildFollowButton(
                userProvider,
                post.userId,
              ),
            ),
            //post content
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Text(post.postContent, style: GlobalVariables.postTextStyle),
            ),
            // like and comment buttons
            PostInteractionWidget(widget.postId),
          ],
        ),
      ),
    );
  }

  bool isFollowed = false;
  TextButton buildFollowButton(UsersProvider userProvider, postUserId) {
    var loggedInUser = userProvider.loggedInUser();
    // bool userIsFollowingTheOther = false;
    if (loggedInUser != null) {
      isFollowed = userProvider.isContaining(loggedInUser.id, postUserId);
    }

    return TextButton.icon(
      onPressed: () {
        setState(() {
          if (loggedInUser != null) {
            userProvider.follow(loggedInUser.id, postUserId);
          } else {
            GlobalSnackbar.showWithAction(
              context,
              'You need to login to Follow!!',
              'LOGIN',
              () {
                GlobalVariables.homeScaffoldKey.currentState!.openDrawer();
              },
            );
          }
        });
      },
      icon:
          isFollowed ? GlobalWidgets.following_icon : GlobalWidgets.follow_icon,
      label: Text(isFollowed ? 'Following' : 'Follow'),
    );
  }
}
