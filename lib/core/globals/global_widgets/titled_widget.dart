import 'package:flutter/material.dart';

import '../global_variables.dart';

class TitledWidget extends StatelessWidget {
  final String title;
  final TextStyle textStyle;
  const TitledWidget(
    this.title,
    this.textStyle, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: GlobalVariables.boxDecoration,
      width: double.infinity,
      height: 75,
      child: Center(
        child: Text(
          title,
          style: textStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
