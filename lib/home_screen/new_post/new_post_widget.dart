import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../core/globals/global_variables.dart';
import '../../core/providers/posts_provider.dart';
import '../../core/providers/users_provider.dart';
import 'new_post_screen.dart';

class NewPostWidget extends StatefulWidget {
  final bool canPost;
  const NewPostWidget({
    required this.canPost,
    Key? key,
  }) : super(key: key);

  @override
  State<NewPostWidget> createState() => _NewPostWidgetState();
}

class _NewPostWidgetState extends State<NewPostWidget> {
  @override
  Widget build(BuildContext context) {
    var canPostValue = widget.canPost;

    print('New Post Widget build method called and canPost is ${canPostValue}');
    PostsProvider postsProvider = Provider.of<PostsProvider>(context);

    TextEditingController postController = TextEditingController();

    UsersModel? loggedInUser =
        Provider.of<UsersProvider>(context).loggedInUser();

    var dummyPostContent = loggedInUser != null
        ? 'Hi I\'m ${loggedInUser.name}, I created a new post at ${DateFormat.yMMMEd().format(DateTime.now())}'
        : '';

    Widget circleAvatar = Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 10,
        backgroundImage: AssetImage(loggedInUser != null
            ? loggedInUser.imgPath
            : GlobalVariables.anonymousImg),
      ),
    );

    OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
      gapPadding: 10,
      borderRadius: BorderRadius.all(
        Radius.circular(
          GlobalVariables.newCommentRadius,
        ),
      ),
    );

    var inputDecoration = InputDecoration(
      label: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('say something ...'),
      ),
      border: outlineInputBorder,
      prefixIcon: circleAvatar,
      suffixIcon: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.camera_enhance),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TextField(
            readOnly: canPostValue ? false : true,
            onTap: () {
              if (!canPostValue) {
                setState(() {
                  Navigator.of(context).pushNamed(NewPostScreen.routeName);
                });
              }
            },
            controller: postController,
            onSubmitted: (value) {
              addNewPost(context, loggedInUser, postsProvider, value);
            },
            decoration: inputDecoration,
          ),
          if (canPostValue)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    addNewPost(
                        context, loggedInUser, postsProvider, dummyPostContent);
                  },
                  child: const Text('dummy post'),
                ),
                ElevatedButton(
                  onPressed: () {
                    addNewPost(context, loggedInUser, postsProvider,
                        postController.text);
                  },
                  child: const Text('post'),
                ),
              ],
            ),
        ],
      ),
    );
  }

  addNewPost(
      BuildContext ctx, loggedInUser, postsProvider, String postContent) {
    var nowDate = DateTime.now();
    setState(() {
      postsProvider.addPost(
        'postId$nowDate',
        loggedInUser.id,
        nowDate,
        postContent,
      );
      Navigator.pop(ctx);
    });
  }
}
