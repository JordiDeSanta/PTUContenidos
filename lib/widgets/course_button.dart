import 'package:flutter/material.dart';
import 'package:sciencenotes/providers/arguments.dart';
import 'package:sciencenotes/utils/texts.dart';

class CourseButton extends StatelessWidget {
  final CourseArguments settings;

  CourseButton(this.settings);

  final styles = TextStyles();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.aspectRatio;
    double w = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: size * 18, horizontal: size * 10),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0.0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(settings.courseColor),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: size * 40),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                height: size * 180,
                image: settings.img!,
                fit: BoxFit.cover,
              ),
              Container(
                padding: EdgeInsets.only(left: size * 40),
                width: w * 0.6,
                child: Text(
                  settings.title!,
                  style: styles.getTitle(context),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, 'course', arguments: settings);
        },
      ),
    );
  }
}
