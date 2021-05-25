import 'package:flutter/material.dart';

class CourseArguments {
  String title;
  Color courseColor;
  Color buttonsColor;
  ImageProvider img;
  List<ThemeArguments> themes;

  CourseArguments({
    this.title,
    this.courseColor,
    this.buttonsColor,
    this.img,
    this.themes,
  });
}

class ThemeArguments {
  String title;
  ImageProvider img;

  ThemeArguments({
    this.title,
    this.img,
  });
}
