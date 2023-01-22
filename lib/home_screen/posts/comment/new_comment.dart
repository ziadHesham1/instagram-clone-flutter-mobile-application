// import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/core/globals/global_variables.dart';
import 'package:instagram_clone/core/globals/global_widgets/global_snackbar.dart';
import 'package:instagram_clone/core/providers/comment_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/posts_provider.dart';

class NewComment extends StatefulWidget {
  final PostModel post;

  const NewComment(this.post, {super.key});

  @override
  State<NewComment> createState() => _NewCommentState();
}

class _NewCommentState extends State<NewComment> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('NewComment build method called');
    var postProvider = Provider.of<PostsProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'add a comment',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(GlobalVariables.newCommentRadius),
            ),
          ),
        ),
        controller: controller,
        onSubmitted: (value) {
          // GlobalSnackbar.show(context, controller.text);
          setState(() {
            postProvider.addComment(
              widget.post.id,
              'comment ${DateTime.now().toString()}',
              widget.post.userId,
              DateTime.now(),
              value,
            );
          });
          controller.clear();
        },
      ),
    );
  }
}
