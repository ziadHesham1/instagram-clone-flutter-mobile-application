import 'package:flutter/material.dart';
import 'package:InstaClone/core/providers/users_provider.dart';
import 'package:provider/provider.dart';

import '../core/globals/global_variables.dart';
import '../core/globals/global_widgets.dart';
import '../home_screen/posts/post/follow_button_widget.dart';

class ProfileDetailsWidget extends StatelessWidget {
  final UsersModel user;
  const ProfileDetailsWidget(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage(user.imgPath),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: GlobalVariables.header,
              ),
              const SizedBox(height: 10),
              Text(
                user.email,
                style: const TextStyle(color: GlobalVariables.primary_color),
              ),
              const SizedBox(height: 5),
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
}
