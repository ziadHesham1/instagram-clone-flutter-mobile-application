// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

abstract class AppWidgets {
  static Widget testImg = const CircleAvatar(
      backgroundImage: AssetImage(
    'img.jpeg',
  ));
  static Widget follow_icon = const Icon(Icons.add_box_outlined);
  static Widget like_icon = const Icon(Icons.thumb_up);
  static Widget comment_icon = const Icon(Icons.comment);
  static ElevatedButton buildElevatedButton(icon, str, fn) {
    return ElevatedButton.icon(
      onPressed: fn,
      icon: icon,
      label: Text(str),
    );
  }
}
