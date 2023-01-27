import 'package:flutter/material.dart';
import 'package:instagram_clone/core/providers/posts_provider.dart';
import 'package:instagram_clone/home_screen/posts/post/post_widget.dart';
import 'package:provider/provider.dart';

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
