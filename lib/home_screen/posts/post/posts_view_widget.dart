import 'package:flutter/material.dart';
import 'package:instagram_clone/core/providers/posts_provider.dart';
import 'package:instagram_clone/home_screen/posts/post/post_widget.dart';
import 'package:provider/provider.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    List<PostModel> posts = Provider.of<PostsProvider>(context).posts;
    return Column(children: [
      ...posts.map(
        (PostModel post) => PostWidget(post.id),
      ),
    ]);

    /*  ListView.builder(
            shrinkWrap: true,
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              return PostWidget(posts[index].id);
            });
   */
  }
}
