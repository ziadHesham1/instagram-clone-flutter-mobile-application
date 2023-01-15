import 'package:flutter/material.dart';

import '../../core/globals/global_variables.dart';
import '../../core/globals/global_widgets/titled_widget.dart';

class Status extends StatelessWidget {
  const Status({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TitledWidget('Status Widget', GlobalVariables.header);
  }
}
