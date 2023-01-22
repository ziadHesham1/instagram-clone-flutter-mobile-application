import 'package:flutter/material.dart';
import 'package:instagram_clone/core/providers/comment_provider.dart';

import 'package:provider/provider.dart';

import '../../../core/globals/global_variables.dart';
import '../../../core/providers/users_provider.dart';

class CommentWidget extends StatelessWidget {
  final CommentModel comment;
  const CommentWidget(this.comment, {super.key});

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UsersProvider>(context).findUserById(comment.userId);
    var commentPublishTime =
        DateTime.now().difference(comment.publishTime).inMinutes.toString();
    print(
        'CommentWidget of comment ${comment.commentContent} build method called');
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.only(bottom: 15),
      decoration: GlobalVariables.boxDecoration,
      width: double.infinity,
      child: Column(
        children: [
          ListTile(
            // comment publisher profile picture
            leading: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage(user.imgPath),
            ),
            // comment publisher user name
            title: Text(user.name),

            // comment date
            subtitle: Text('$commentPublishTime min'),
          ),
          //comment content
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              comment.commentContent,
              // style: GlobalVariables.smaller_header,
            ),
          ),
        ],
      ),
    );
  }
}
