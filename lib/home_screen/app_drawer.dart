// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:instagram_clone/core/globals/global_variables.dart';
import 'package:provider/provider.dart';

import '../core/providers/users_provider.dart';
import '../profile/profile_screen.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UsersProvider>(context);
    var users = userProvider.users;
    var loggedInUser = userProvider.loggedInUser();

    return Drawer(
      child: Column(children: [
        InkWell(
          onTap: () => setState(
            () {
              Navigator.of(context).pushNamed(ProfileScreen.routeName);
            },
          ),
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            child: CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage(
                loggedInUser != null
                    ? loggedInUser.imgPath
                    : GlobalVariables.anonymousImg,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return buildDrawerListTile(
                    loggedInUser, userProvider, users[index]);
              }),
        )
      ]),
    );
  }

  ListTile buildDrawerListTile(loggedInUser, userProvider, user) {
    //
    var loginText = const Text('Log in');
    var logoutText = const Text('Log out', style: GlobalVariables.redText);
    var switchText = const Text('switch');

    var trailingText = loggedInUser == null
        ? loginText
        : (loggedInUser == user ? logoutText : switchText);
    return ListTile(
      // post publisher profile picture
      leading: CircleAvatar(
        backgroundImage: AssetImage(user.imgPath),
      ),
      // post publisher user name
      title: Text(
        user.name,
        style: GlobalVariables.post_content_text,
      ),
      // subtitle: Text('isLoggedIn : ${user.isLoggedIn}'),
      trailing: TextButton(
        child: trailingText,
        onPressed: () {
          userProvider.toggleLoggedInUser(user.id);
        },
      ),
    );
  }
}
