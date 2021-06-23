import 'package:flutter/material.dart';

class CourseArguments {
  String title;
  Color courseColor;
  Color buttonsColor;
  String pRoute;
  ImageProvider img;
  List<ThemeArguments> themes;

  CourseArguments({
    this.title,
    this.courseColor,
    this.buttonsColor,
    this.img,
    this.themes,
    this.pRoute,
  });
}

class ThemeArguments {
  String title;
  ImageProvider img;
  List<ContentArguments> contents;

  ThemeArguments({
    this.title,
    this.img,
    this.contents,
  });
}

class ContentArguments {
  String title;
  ImageProvider img;
  String pdfRoute;
  String vidUrl;

  ContentArguments({
    this.title,
    this.img,
    this.pdfRoute,
    this.vidUrl = '',
  });
}
