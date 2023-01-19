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
    UsersProvider userProvider = Provider.of<UsersProvider>(context);
    var mediaQuery = MediaQuery.of(context);

    widgetHeight = mediaQuery.size.height * 0.4;
    widgetWidth = mediaQuery.size.width * 0.45;
    return Row(
      children: [
        buildUsersList(
          'Followings',
          userProvider,
          widget.user.followings,
        ),
        buildUsersList(
          'Followers',
          userProvider,
          widget.user.followers,
        ),
      ],
    );
  }

  Widget buildUsersList(
    String header,
    UsersProvider userProvider,
    Set<String> userIdsList,
  ) {
    var loggedInUser = userProvider.loggedInUser();

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
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(GlobalVariables.postBorderRadius),
            border: Border.all(color: GlobalVariables.post_border_color),
          ),
          child: ListView.builder(
            itemCount: userIdsList.length,
            itemBuilder: (context, index) {
              var user = userProvider.findUserById(userIdsList.elementAt(index));
              return ListTile(
                // post publisher profile picture

                /*  InkWell(
            onTap: () {
              if (loggedInUser != null) {
                Navigator.of(context).pushNamed(ProfileScreen.routeName);
              } else {
                GlobalSnackbar.showWithLoginAction(
                  context,
                  'You need to login to see your profile!!',
                );
              }
            }, */

                leading: InkWell(
                  onTap: () {
                    if (loggedInUser != null) {
                      Navigator.of(context).pushNamed(ProfileScreen.routeName);
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
