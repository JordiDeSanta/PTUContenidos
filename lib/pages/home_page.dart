import 'package:flutter/material.dart';
import 'package:ptucontenidos/providers/arguments.dart';
import 'package:ptucontenidos/utils/texts.dart';
import 'package:ptucontenidos/widgets/course_button.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  final styles = TextStyles();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.aspectRatio;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('PTU Ciencias', style: styles.getTitle(context)),
        centerTitle: true,
        toolbarHeight: size * 140,
        backgroundColor: Colors.black38,
      ),
      body: ListView(
        children: [
          SizedBox(height: 5),
          biology(),
          physics(),
          chemistry(),
        ],
      ),
    );
  }
}

Widget biology() {
  return CourseButton(
    CourseArguments(
      img: AssetImage('assets/img/biology.png'),
      buttonsColor: Colors.greenAccent,
      courseColor: Colors.greenAccent[400],
      title: "Biología",
      themes: <ThemeArguments>[
        ThemeArguments(
          title: 'Organización, Estructura y Actividad Celular',
          img: AssetImage('assets/img/bio1.jpeg'),
        ),
        ThemeArguments(
          title: 'Procesos y Funciones Biológicas',
          img: AssetImage('assets/img/bio2.jpg'),
        ),
        ThemeArguments(
          title: 'Herencia y Evolución',
          img: AssetImage('assets/img/bio3.jpg'),
        ),
        ThemeArguments(
          title: 'Organismo y Ambiente',
          img: AssetImage('assets/img/bio4.jfif'),
        ),
      ],
    ),
  );
}

Widget physics() {
  return CourseButton(
    CourseArguments(
      img: AssetImage('assets/img/physics.png'),
      buttonsColor: Colors.purple,
      courseColor: Colors.purple,
      title: "Física",
    ),
  );
}

Widget chemistry() {
  return CourseButton(
    CourseArguments(
      img: AssetImage('assets/img/chemistry.png'),
      buttonsColor: Colors.lightGreen,
      courseColor: Colors.lightGreen,
      title: "Química",
    ),
  );
}
