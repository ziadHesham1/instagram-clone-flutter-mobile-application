import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/globals/global_variables.dart';
import '../core/providers/posts_provider.dart';
import '../core/providers/users_provider.dart';
import '../home_screen/posts/post/posts_view_widget.dart';

class ProfilePostsWidget extends StatelessWidget {
 final UsersModel user;
  const ProfilePostsWidget(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
     PostsProvider postProvider = Provider.of<PostsProvider>(context);

    var userPosts = postProvider.userPosts(user.id);
   
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            'Posts (${userPosts.length})',
            style: GlobalVariables.sectionTitleTextStyle,
          ),
        ),
        PostsView(userPosts),
      ],
    );
  }

 
}
