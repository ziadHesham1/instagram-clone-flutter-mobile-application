import 'package:flutter/material.dart';
import 'package:instagram_clone/core/globals/global_border_box.dart';
import 'package:instagram_clone/core/globals/global_widgets.dart';
import 'package:instagram_clone/core/providers/posts_provider.dart';
import 'package:instagram_clone/home_screen/posts/post/follow_button_widget.dart';
import 'package:instagram_clone/home_screen/posts/post/posts_view_widget.dart';
import 'package:instagram_clone/profile/profile_posts_widget.dart';
import 'package:instagram_clone/profile/profile_summery_widget.dart';
import 'package:provider/provider.dart';

import '../core/globals/global_variables.dart';
import '../core/providers/users_provider.dart';
import 'profile_details_widget.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/ProfileScreen route';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsersProvider userProvider = Provider.of<UsersProvider>(context);
    UsersModel? loggedInUser = userProvider.loggedInUser();
    String? clickedPostUserId =
        ModalRoute.of(context)!.settings.arguments as String?;
    PostsProvider postProvider = Provider.of<PostsProvider>(context);

    UsersModel? user;
    if (clickedPostUserId != null) {
      user = userProvider.findUserById(clickedPostUserId);
    } else if (loggedInUser != null) {
      user = loggedInUser;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Profile'),
      ),
      body: user != null
          ? SingleChildScrollView(
              child: Column(
                children: [
                  ProfileDetailsWidget(user),
                  ProfileSummeryWidget(
                    user,
                  ),
                  // FollowListsChecker(user),
                  ProfilePostsWidget(user),
                ],
              ),
            )
          : const Text(
              'No Profile Found',
              style: GlobalVariables.header,
            ),
    );
  }
}
