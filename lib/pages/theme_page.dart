import 'package:flutter/material.dart';
import 'package:ptucontenidos/providers/arguments.dart';
import 'package:ptucontenidos/utils/texts.dart';
import 'package:ptucontenidos/widgets/content_button.dart';

class ThemePage extends StatelessWidget {
  ThemePage();

  final styles = TextStyles();

  @override
  Widget build(BuildContext context) {
    final List settings = ModalRoute.of(context).settings.arguments;
    final ThemeArguments theme = settings[0];
    final Color color = settings[1];
    double size = MediaQuery.of(context).size.aspectRatio;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(theme.title, style: styles.getSubtitle(context)),
        centerTitle: true,
        toolbarHeight: size * 140,
        backgroundColor: color,
      ),
      body: ListView(
        children: createButtons(theme, color),
      ),
    );
  }
}

List<Widget> createButtons(ThemeArguments args, Color c) {
  List<Widget> buttons = [];

  args.contents.forEach(
    (e) {
      Widget _temp = ContentButton(settings: e, color: c);
      buttons.add(_temp);
    },
  );

  return buttons;
}
