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
  static const primary_color = Colors.blueGrey;
  static const TextStyle redText = TextStyle(color: Colors.red);

  // Global Styles
  static const TextStyle header = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle smaller_header = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle post_content_text = TextStyle(
    fontSize: 18,
    // fontWeight: FontWeight.w500,
  );
  static const TextStyle profile_details_text = TextStyle(
    fontSize: 18,
    color: primary_color,
    fontWeight: FontWeight.w500,
  );
  static const sectionTitleTextStyle =
      TextStyle(fontSize: 28, fontWeight: FontWeight.w800);

  static const postTextStyle = TextStyle(
    fontSize: 18,
  );
  static const userNameTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  // margins
  static const borderBoxMargin = EdgeInsets.all(10);

  static BoxDecoration boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(GlobalVariables.postBorderRadius),
    border: Border.all(color: GlobalVariables.primary_color),
  );
}
