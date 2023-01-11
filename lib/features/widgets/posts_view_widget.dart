import 'package:flutter/material.dart';
import 'package:instagram_clone/core/providers/posts_provider.dart';
import 'package:instagram_clone/features/widgets/post_widget.dart';
import 'package:provider/provider.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    var providedPosts = Provider.of<PostsProvider>(context).posts;
    return Expanded(
      child: ListView(
        children: [
          ...providedPosts.map(
            (PostModel post) => PostWidget(post.id),
          ),
        ],
      ),
    );
  }
}
