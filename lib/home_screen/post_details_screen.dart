import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/providers/posts_provider.dart';
import 'posts/comment/comments_widget.dart';
import 'posts/comment/new_comment_widget.dart';
import 'posts/post/post_widget.dart';

class PostDetailsScreen extends StatelessWidget {
  static String routeName = '/PostDetailsScreen_route';

  const PostDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PostModel post = ModalRoute.of(context)!.settings.arguments as PostModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostWidget(post.id),
            NewCommentWidget(post),
            Consumer<PostsProvider>(
              builder: (context, postProvider, child) {
                return CommentsWidget(
                    postProvider.findPostById(post.id).comments);
              },
            )
            // CommentsWidget(comments.reversed.toList()),

            /*  Container(
          alignment: Alignment.bottomCenter, // align the row
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                )
              )
            ],
          )
        )
          ); */
          ],
        ),
      ),
    );
  }
}
