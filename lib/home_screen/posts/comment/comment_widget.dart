import 'package:flutter/material.dart';
import 'package:instagram_clone/core/providers/comment_provider.dart';

import 'package:provider/provider.dart';

import '../../../core/providers/users_provider.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_styles.dart';
import '../../../core/widgets/app_widgets.dart';

class CommentWidget extends StatelessWidget {
  final CommentModel comment;
  const CommentWidget(this.comment, {super.key});

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UsersProvider>(context).findUserById(comment.userId);
    var commentPublishTime =
        DateTime.now().difference(comment.publishTime).inMinutes.toString();
    return Container(
      margin: const EdgeInsets.all(5),
      // padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.post_border_color),
      ),
      width: double.infinity,
      height: 200,
      child: Column(
        children: [
          ListTile(
            // comment publisher profile picture
            leading: CircleAvatar(
              backgroundImage: AssetImage(user.imgPath),
            ),
            // comment publisher user name
            title: Text(user.name),

            // comment date
            subtitle: Text('$commentPublishTime min'),
            // follow button
            trailing: AppWidgets.buildElevatedButton(
                AppWidgets.follow_icon, 'Follow', () {}),
          ),
          //comment content
          Text(
            comment.commentContent,
            style: AppStyles.smaller_header,
          ),
        ],
      ),
    );
  }
}
