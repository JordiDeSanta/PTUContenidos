import 'package:flutter/material.dart';

class TextStyles {
  double getSize(BuildContext c) {
    double size = MediaQuery.of(c).size.height;

    return size;
  }

  TextStyle getTitle(BuildContext c) {
    return TextStyle(
      color: Colors.white,
      fontSize: getSize(c) * 0.04,
    );
  }

  TextStyle getSubtitle(BuildContext c) {
    return TextStyle(
      color: Colors.white,
      fontSize: getSize(c) * 0.02,
    );
  }
}
