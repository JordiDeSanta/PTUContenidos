import 'package:flutter/material.dart';
import 'package:sciencenotes/providers/arguments.dart';
import 'package:sciencenotes/utils/texts.dart';

class ContentButton extends StatelessWidget {
  final ContentArguments settings;
  final Color color;

  ContentButton({required this.settings, required this.color});

  final styles = TextStyles();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.aspectRatio;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(5),
      height: h * 0.15,
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
              width: w * 0.65,
              padding: EdgeInsets.all(15),
              child: Text(
                settings.title!,
                style: styles.getSubtitle(context),
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  width: w * 0.02,
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
