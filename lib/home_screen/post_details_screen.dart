import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/home_screen/posts/comment/new_comment.dart';
import '../../../core/providers/comment_provider.dart';

import '../core/providers/posts_provider.dart';
import 'posts/comment/comments_widget.dart';
import 'posts/post/post_widget.dart';

class PostDetailsScreen extends StatelessWidget {
  static String routeName = '/PostDetailsScreen_route';

  const PostDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PostModel post = ModalRoute.of(context)!.settings.arguments as PostModel;
    List<CommentModel> comments = post.comments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostWidget(post.id),
            NewComment(post),
           
            CommentsWidget(comments),

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
