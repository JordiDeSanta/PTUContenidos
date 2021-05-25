import 'package:flutter/material.dart';
import 'package:ptucontenidos/providers/arguments.dart';
import 'package:ptucontenidos/utils/texts.dart';

class ContentButton extends StatelessWidget {
  final ContentArguments settings;
  final Color color;

  ContentButton({this.settings, this.color});

  final styles = TextStyles();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.aspectRatio;

    return Container(
      padding: EdgeInsets.all(5),
      height: size * 180,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, 'content', arguments: [settings, color]);
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
        child: Row(
          children: [
            Container(
              width: size * 450,
              padding: EdgeInsets.all(15),
              child: Text(
                settings.title,
                style: styles.getSubtitle(context),
              ),
            ),
            Expanded(
              child: ClipRRect(
                child: Image(
                  image: settings.img,
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
