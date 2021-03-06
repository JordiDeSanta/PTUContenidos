import 'package:flutter/material.dart';
import 'package:sciencenotes/providers/arguments.dart';
import 'package:sciencenotes/utils/texts.dart';

class ThemeButton extends StatelessWidget {
  final ThemeArguments settings;
  final Color color;

  ThemeButton({required this.settings, required this.color});

  final styles = TextStyles();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.all(3),
      height: h * 0.38,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, 'theme', arguments: [settings, color]);
        },
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          backgroundColor: MaterialStateProperty.all(color),
          elevation: MaterialStateProperty.all(0.0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                settings.title!,
                style: styles.getSubtitle(context),
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: settings.img!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
