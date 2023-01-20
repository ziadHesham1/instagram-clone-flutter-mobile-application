import 'package:flutter/material.dart';
import 'package:instagram_clone/core/globals/global_widgets.dart';
import 'package:instagram_clone/home_screen/posts/post/follow_button_widget.dart';
import 'package:instagram_clone/main.dart';
import 'package:instagram_clone/profile/follow_lists_checker.dart';
import 'package:provider/provider.dart';

import '../core/globals/global_variables.dart';
import '../core/providers/users_provider.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/ProfileScreen route';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQueryData mediaQuery = MediaQuery.of(context);

    UsersProvider userProvider = Provider.of<UsersProvider>(context);
    UsersModel? loggedInUser = userProvider.loggedInUser();
    String? clickedPostUserId =
        ModalRoute.of(context)!.settings.arguments as String?;

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
                  buildProfileDetails(user),
                  buildProfileNumbers(user),
                  // FollowListsChecker(user),
                ],
              ),
            )
          : const Text(
              'No Profile Found',
              style: GlobalVariables.header,
            ),
    );
  }

  Widget buildProfileDetails(UsersModel user) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage(user.imgPath),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: GlobalVariables.header,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                user.email,
                style: const TextStyle(color: GlobalVariables.primary_color),
              ),
              // follow and chat buttons
              Row(
                children: [
                  Container(
                      decoration: GlobalVariables.boxDecoration,
                      child: FollowButtonWidget(user.id)),

                  // chat button
                  Container(
                    margin: const EdgeInsets.all(10),
                    decoration: GlobalVariables.boxDecoration,
                    child: TextButton.icon(
                        onPressed: () {},
                        icon: GlobalWidgets.chat_icon,
                        label: const Text('Chat')),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildProfileNumbers(UsersModel user) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(15),
      decoration: GlobalVariables.boxDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildNumberBox(100, 'Posts'),
          buildNumberBox(user.followers.length, 'Followers'),
          buildNumberBox(user.followings.length, 'Following'),
        ],
      ),
    );
  }

  Widget buildNumberBox(int number, String txt) {
    return Column(
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
