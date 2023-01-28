import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/posts_provider.dart';
import 'post_widget.dart';

class PostsView extends StatelessWidget {
  final List<PostModel> posts;
  const PostsView(this.posts, {super.key});

  @override
  Widget build(BuildContext context) {
    print('PostsView build method called');

    return Consumer(
      builder: (BuildContext context, value, _) {
        return Column(children: [
          ...posts.map(
            (PostModel post) => PostWidget(post.id),
          ),
        ]);
      },
    );
  }
}
