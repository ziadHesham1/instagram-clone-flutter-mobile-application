import 'package:flutter/material.dart';

import 'global_variables.dart';

// ignore: must_be_immutable
class GlobalBorderBox extends StatelessWidget {
  final Widget boxChild;
  double boxMargin = 0.0;
  double boxPadding = 0.0;
  GlobalBorderBox({
    required this.boxChild,
    required this.boxMargin,
    required this.boxPadding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.all(boxMargin),
      padding:  EdgeInsets.all(boxPadding),
      decoration: GlobalVariables.boxDecoration,
      child: boxChild,
    );
  }
}
