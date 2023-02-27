import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/globals/global_variables.dart';
import '../core/globals/global_widgets/global_snackbar.dart';
import '../core/providers/users_provider.dart';
import 'profile_screen.dart';

class FollowListsChecker extends StatefulWidget {
  final UsersModel user;
  // final MediaQueryData mediaQuery;
  const FollowListsChecker(this.user, /*  this.mediaQuery, */ {super.key});

  @override
  State<FollowListsChecker> createState() => _FollowListsCheckerState();
}

class _FollowListsCheckerState extends State<FollowListsChecker> {
  double widgetHeight = 0.0;

  double widgetWidth = 0.0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    widgetHeight = size.height * 0.4;
    widgetWidth = size.width * 0.45;
    return Row(
      children: [
        buildUsersList(
          'Followings',
          widget.user.followings,
        ),
        buildUsersList(
          'Followers',
          widget.user.followers,
        ),
      ],
    );
  }

  Widget buildUsersList(String header, Set<String> userIdsList) {
    UsersProvider userProvider = Provider.of<UsersProvider>(context);
    UsersModel? loggedInUser = userProvider.loggedInUser();

    return Column(
      children: [
        Text(
          header,
          style: GlobalVariables.header,
        ),
        Container(
          height: widgetHeight,
          width: widgetWidth,
          margin: const EdgeInsets.all(10),
          // padding: const EdgeInsets.all(10),
          decoration: GlobalVariables.boxDecoration,
          child: ListView.builder(
            itemCount: userIdsList.length,
            itemBuilder: (context, index) {
              var user =
                  userProvider.findUserById(userIdsList.elementAt(index));
              return ListTile(
                // post publisher profile picture

                leading: InkWell(
                  onTap: () {
                    if (loggedInUser != null) {
                      Navigator.of(context).pushNamed(ProfileScreen.routeName,
                          arguments: user.id);
                    } else {
                      GlobalSnackbar.showWithLoginAction(
                        context,
                        'You need to login to see your profile!!',
                      );
                    }
                  },
                  child: CircleAvatar(
                    backgroundImage: AssetImage(user.imgPath),
                  ),
                ),
                // post publisher user name
                title: Text(
                  user.name,
                  style: GlobalVariables.post_content_text_style,
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
