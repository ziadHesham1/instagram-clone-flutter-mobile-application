import 'package:flutter/material.dart';
import 'package:InstaClone/core/providers/users_provider.dart';
import 'package:InstaClone/home_screen/new_post/new_post_widget.dart';
import 'package:provider/provider.dart';

class NewPostScreen extends StatefulWidget {
  static String routeName = '/NewPostScreen';
  const NewPostScreen({super.key});

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  @override
  Widget build(BuildContext context) {
    UsersModel? loggedInUser =
        Provider.of<UsersProvider>(context).loggedInUser();
    return Scaffold(
      appBar: AppBar(title: const Text('create New Post')),
      body: (loggedInUser != null)
          ? const NewPostWidget(canPost: true)
          : Container(),
    );
  }
}
