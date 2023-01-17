// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class GlobalVariables {
  // Global Images path
  static String anonymousImg = 'images/anonymous_user.png';
  static String ziadImg = 'images/ziad_img.jpeg';
  static String tarekImg = 'images/tarek_img.png';
  static String mostafaImg = 'images/mostafa_img.JPG';

  //
  static String longText =
      'By default, ListView will automatically pad the list\'s scrollable extremities ';

  // Global Scaffold Key
  static GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey(); // Create a

// radius
  static const double postBorderRadius = 6;
     static const double newCommentRadius = 15;


  // Global Colors
  static const post_border_color = Colors.blueGrey;

  // Global Styles
  static const TextStyle header = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle smaller_header = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle bigger_text = TextStyle(
    fontSize: 18,
    // fontWeight: FontWeight.w500,
  );

  static const postTextStyle = TextStyle(
    fontSize: 18,
  );
  static const TextStyle redText = TextStyle(color: Colors.red);
}
