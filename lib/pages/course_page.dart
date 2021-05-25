import 'package:flutter/material.dart';
import 'package:ptucontenidos/providers/arguments.dart';
import 'package:ptucontenidos/utils/texts.dart';
import 'package:ptucontenidos/widgets/theme_button.dart';

class CoursePage extends StatelessWidget {
  CoursePage();

  final styles = TextStyles();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.aspectRatio;
    double h = MediaQuery.of(context).size.height;
    final CourseArguments settings = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(settings.title, style: styles.getTitle(context)),
        centerTitle: true,
        toolbarHeight: h * 0.1,
        backgroundColor: settings.courseColor,
      ),
      backgroundColor: Colors.white,
      body: Table(
        children: [
          TableRow(
            children: [
              ThemeButton(
                settings: settings.themes[0],
                color: settings.buttonsColor,
              ),
              ThemeButton(
                settings: settings.themes[1],
                color: settings.buttonsColor,
              ),
            ],
          ),
          TableRow(
            children: [
              ThemeButton(
                settings: settings.themes[2],
                color: settings.buttonsColor,
              ),
              settings.themes.length == 4
                  ? ThemeButton(
                      settings: settings.themes[3],
                      color: settings.buttonsColor,
                    )
                  : Container(),
            ],
          )
        ],
      ),
    );
  }
}
