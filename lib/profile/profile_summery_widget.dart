import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/globals/global_variables.dart';
import '../core/providers/posts_provider.dart';
import '../core/providers/users_provider.dart';

class ProfileSummeryWidget extends StatelessWidget {
  final UsersModel user;
  const ProfileSummeryWidget(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    PostsProvider postProvider = Provider.of<PostsProvider>(context);

    var userPosts = postProvider.userPosts(user.id);
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(15),
      decoration: GlobalVariables.boxDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          numberBox(userPosts.length, 'Posts'),
          numberBox(user.followers.length, 'Followers'),
          numberBox(user.followings.length, 'Following'),
        ],
      ),
    );
  }
  // Widget _boxNumber({required int number, required String txt}) {

  Widget numberBox(int number, String txt) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$number',
          style: GlobalVariables.profile_details_text,
        ),
        Text(
          txt,
          style: GlobalVariables.profile_details_text,
        ),
      ],
    );
  }
}
