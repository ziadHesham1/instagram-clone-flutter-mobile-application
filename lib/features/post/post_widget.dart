import 'package:flutter/material.dart';
import 'package:instagram_clone/core/widgets/app_widgets.dart';
import 'package:instagram_clone/core/themes/app_styles.dart';

import '../../core/providers/posts_provider.dart';
import '../../core/themes/app_colors.dart';

class PostWidget extends StatelessWidget {
  final PostModel post;
  const PostWidget(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    var postPublishTime =
        DateTime.now().difference(post.dateTime).inMinutes.toString();
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
            // post publisher profile picture
            leading: AppWidgets.testImg,
            // post publisher user name
            title: Text(post.name),
            // post date
            subtitle: Text('$postPublishTime min'),
            // follow button
            trailing: AppWidgets.buildElevatedButton(
                AppWidgets.follow_icon, 'Follow', () {}),
          ),
          //post content
          Text(post.postContent, style: AppStyles.smaller_header),
          const Spacer(),
          // like and comment buttons
          const PostInteractionWidget(),
        ],
      ),
    );
  }
}
