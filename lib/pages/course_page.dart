import 'package:flutter/material.dart';
import 'package:ptucontenidos/providers/arguments.dart';
import 'package:ptucontenidos/utils/texts.dart';

class CoursePage extends StatelessWidget {
  CoursePage();

  final styles = TextStyles();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.aspectRatio;
    final CourseArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(args.title, style: styles.getTitle(context)),
        centerTitle: true,
        toolbarHeight: size * 140,
        backgroundColor: args.courseColor,
      ),
      body: Table(
        children: [
          TableRow(
            children: [
              _createButton(),
              _createButton(),
            ],
          ),
          TableRow(
            children: [
              _createButton(),
              _createButton(),
            ],
          )
        ],
      ),
    );
  }
}

Widget _createButton() {
  return Container(
    padding: EdgeInsets.all(10),
    height: 350,
    child: ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0.0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
      child: null,
    ),
  );
}
