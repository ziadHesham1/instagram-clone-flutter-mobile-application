import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/globals/global_variables.dart';
import '../../../core/providers/posts_provider.dart';

class NewCommentWidget extends StatefulWidget {
  final PostModel post;

  const NewCommentWidget(this.post, {super.key});

  @override
  State<NewCommentWidget> createState() => _NewCommentWidgetState();
}

class _NewCommentWidgetState extends State<NewCommentWidget> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('NewComment build method called');
    var postProvider = Provider.of<PostsProvider>(context);
    const outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(
          GlobalVariables.newCommentRadius,
        ),
      ),
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          suffixIcon:
              IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
          labelText: 'add a comment',
          border: outlineInputBorder,
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
