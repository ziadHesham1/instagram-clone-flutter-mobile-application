import 'package:flutter/material.dart';

import '../../core/themes/app_styles.dart';
import '../../core/widgets/titled_widget.dart';

class Status extends StatelessWidget {
  const Status({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TitledWidget('Status Widget', AppStyles.header);
  }
}
