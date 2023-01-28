import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/providers/users_provider.dart';
import 'new_post_widget.dart';

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
