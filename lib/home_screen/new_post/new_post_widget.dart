import 'package:flutter/material.dart';
import 'package:instagram_clone/core/themes/app_styles.dart';
import 'package:instagram_clone/core/widgets/titled_widget.dart';

class NewPost extends StatelessWidget {
  const NewPost({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TitledWidget('New Post Widget',AppStyles.header);
  }
}
