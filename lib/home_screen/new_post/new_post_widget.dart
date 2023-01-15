import 'package:flutter/material.dart';
import 'package:instagram_clone/core/globals/global_widgets/titled_widget.dart';

import '../../core/globals/global_variables.dart';

class NewPost extends StatelessWidget {
  const NewPost({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TitledWidget('New Post Widget', GlobalVariables.header);
  }
}
