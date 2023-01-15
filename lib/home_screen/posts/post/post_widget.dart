import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../core/globals/global_variables.dart';
import '../../../core/providers/posts_provider.dart';
import '../../../core/providers/users_provider.dart';
import '../../../core/globals/global_widgets.dart';
import 'post_interaction_widget.dart';

class PostWidget extends StatelessWidget {
  final String postId;
  const PostWidget(this.postId, {super.key});

  @override
  Widget build(BuildContext context) {
    var post = Provider.of<PostsProvider>(context).findPostById(postId);
    var user = Provider.of<UsersProvider>(context).findUserById(post.userId);
    var postPublishTime =
        DateTime.now().difference(post.postPublishTime).inMinutes.toString();
    return Container(
      margin: const EdgeInsets.all(5),
      // padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: GlobalVariables.post_border_color),
      ),
      width: double.infinity,
      height: 170,
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
            trailing: TextButton.icon(
              onPressed: () {},
              icon: GlobalWidgets.follow_icon,
              label: const Text('Follow'),
            ),
          ),
          //post content
          Text(
            post.postContent,
            style: GlobalVariables.smaller_header,
          ),
          const Spacer(),
          // like and comment buttons
          PostInteractionWidget(postId),
        ],
      ),
    );
  }
}
