import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/providers/users_provider.dart';
import 'new_post/new_post_widget.dart';
import 'posts/post/posts_view_widget.dart';
import 'status/status_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UsersProvider>(context);
    var loggedInUser = userProvider.loggedInUser();
    var users = userProvider.users;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Arabian Social Media',
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                loggedInUser != null
                    ? loggedInUser.imgPath
                    : 'images/anonymous_user.png',
              ),
            ),
          )
        ],
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage(
                loggedInUser != null
                    ? loggedInUser.imgPath
                    : 'images/anonymous_user.png',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  var user = users[index];

                  return ListTile(
                      // post publisher profile picture
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(user.imgPath),
                      ),
                      // post publisher user name
                      title: Text(user.name),
                      subtitle: Text('isLoggedIn : ${user.isLoggedIn}'),
                      trailing:
                          buildTrailing(loggedInUser, userProvider, user));
                }),
          )
        ]),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Status(),
              NewPost(),
              SizedBox(
                height: 20,
              ),
              PostsView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTrailing(
    UsersModel? loggedInUser,
    UsersProvider userProvider,
    UsersModel user,
  ) {
    var logoutButton = buildTextButton(
      const Text(
        'Log out',
        style: TextStyle(color: Colors.red),
      ),
      () {
        userProvider.toggleLoggedInUser(user.id);
      },
    );
    var loginButton = buildTextButton(
      const Text('Log in'),
      () {
        userProvider.toggleLoggedInUser(user.id);
      },
    );
    var switchButton = buildTextButton(
      const Text('switch'),
      () {
        userProvider.toggleLoggedInUser(user.id);
      },
    );
    if (loggedInUser == null) {
      return loginButton;
    } else {
      if (loggedInUser == user) {
        return logoutButton;
      } else {
        return switchButton;
      }
              // return logoutButton;

    }
  }

  Widget buildTextButton(Widget child, fn) {
    return TextButton(
      onPressed: fn,
      child: child,
    );
  }
}
