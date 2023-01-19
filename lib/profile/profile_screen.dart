import 'package:flutter/material.dart';
import 'package:instagram_clone/core/globals/global_widgets.dart';
import 'package:instagram_clone/home_screen/posts/post/follow_button_widget.dart';
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
    var loggedInUser = userProvider.loggedInUser();
    var clickedPostUserId =
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
          ? Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildProfilePicture(user),
                      buildProfileDetails(user),
                    ],
                  ),
                ),
                FollowListsChecker(user,/* mediaQuery */),
              ],
            )
          : const Text(
              'No Profile Found',
              style: GlobalVariables.header,
            ),
    );
  }

  Container buildProfileDetails(UsersModel user) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.name,
            style: GlobalVariables.header,
          ),
          Text(user.email),
          Row(
            children: [
              FollowButtonWidget(user.id),
              TextButton.icon(
                  onPressed: () {},
                  icon: GlobalWidgets.chat_icon,
                  label: const Text('Chat')),
            ],
          )
        ],
      ),
    );
  }

  Widget buildProfilePicture(UsersModel user) {
    return CircleAvatar(
      radius: 50.0,
      backgroundImage: AssetImage(user.imgPath
          // : GlobalVariables.anonymousImg,
          ),
    );
  }

  Widget buildUsersList(
      String header, UsersProvider userProvider, List<String> userIdsList) {
    return Column(
      children: [
        Text(
          header,
          style: GlobalVariables.header,
        ),
        SizedBox(
          width: 200,
          height: 200,
          child: ListView.builder(
            itemCount: userIdsList.length,
            itemBuilder: (context, index) {
              var user = userProvider.findUserById(userIdsList[index]);
              return ListTile(
                // post publisher profile picture
                leading: CircleAvatar(
                  backgroundImage: AssetImage(user.imgPath),
                ),
                // post publisher user name
                title: Text(
                  user.name,
                  style: GlobalVariables.bigger_text,
                ),
                // subtitle: Text('isLoggedIn : ${user.isLoggedIn}'),
              );
            },
          ),
        ),
      ],
    );
  }
}
