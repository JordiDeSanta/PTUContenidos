import 'package:flutter/material.dart';

class TextStyles {
  double getSize(BuildContext c) {
    double size = MediaQuery.of(c).size.aspectRatio;

    return size;
  }

  TextStyle getTitle(BuildContext c) {
    return TextStyle(
      color: Colors.white,
      fontSize: getSize(c) * 60,
    );
  }

  TextStyle getSubtitle(BuildContext c) {
    return TextStyle(
      color: Colors.white,
      fontSize: getSize(c) * 30,
    );
  }
}
