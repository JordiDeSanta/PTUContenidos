import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:ptucontenidos/providers/ad_state.dart';
import 'package:ptucontenidos/providers/arguments.dart';
import 'package:ptucontenidos/utils/texts.dart';
import 'package:ptucontenidos/widgets/course_button.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final styles = TextStyles();

  BannerAd banner;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      setState(() {
        banner = BannerAd(
          adUnitId: adState.bannerAdUnitId,
          size: AdSize.largeBanner,
          request: AdRequest(),
          listener: adState.adListener,
        )..load();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('PTU Ciencias', style: styles.getTitle(context)),
        centerTitle: true,
        toolbarHeight: h * 0.1,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(height: 5),
          biology(),
          physics(),
          chemistry(),
          if (banner == null)
            Container()
          else
            Container(
              height: h * 0.2,
              child: AdWidget(
                ad: banner,
              ),
            ),
        ],
      ),
    );
  }
}

Widget biology() {
  return CourseButton(
    CourseArguments(
      img: AssetImage('assets/icons/biology.png'),
      buttonsColor: Colors.greenAccent,
      courseColor: Colors.greenAccent[400],
      title: "Biología",
      themes: <ThemeArguments>[
        ThemeArguments(
          title: 'Organización, Estructura y Actividad Celular',
          img: AssetImage('assets/img/bio1.jpeg'),
          contents: <ContentArguments>[
            ContentArguments(
              title: 'Organelos de las Células',
              img: AssetImage('assets/icons/biology/celula.png'),
              pdfRoute: 'assets/pdf/Biology/celulas.pdf',
            ),
            ContentArguments(
              title: 'Tipos Celulares',
              img: AssetImage('assets/icons/biology/tipos.png'),
              pdfRoute: 'assets/pdf/Biology/tipos.pdf',
            ),
            ContentArguments(
              title: 'Transportes en la Membrana',
              img: AssetImage('assets/icons/biology/membrane.png'),
              pdfRoute: 'assets/pdf/Biology/membrana.pdf',
            ),
          ],
        ),
        ThemeArguments(
          title: 'Procesos y Funciones Biológicas',
          img: AssetImage('assets/img/bio2.jpg'),
          contents: <ContentArguments>[
            ContentArguments(
              title: 'Sexualidad y Pubertad',
              img: AssetImage('assets/icons/biology/sexuality.png'),
              pdfRoute: 'assets/pdf/Biology/sex.pdf',
            ),
            ContentArguments(
              title: 'Embarazo y Lactancia',
              img: AssetImage('assets/icons/biology/mother.png'),
              pdfRoute: 'assets/pdf/Biology/embarazo.pdf',
            ),
            ContentArguments(
              title: 'Control de Natalidad',
              img: AssetImage('assets/icons/biology/baby.png'),
              pdfRoute: 'assets/pdf/Biology/natalidad.pdf',
            ),
            ContentArguments(
              title: 'ITS',
              img: AssetImage('assets/icons/biology/its.png'),
              pdfRoute: 'assets/pdf/Biology/its.pdf',
            ),
            ContentArguments(
              title: 'Nutrientes y Biomoléculas',
              img: AssetImage('assets/icons/biology/protein.png'),
              pdfRoute: 'assets/pdf/Biology/biomol.pdf',
            ),
            ContentArguments(
              title: 'Hormonas',
              img: AssetImage('assets/icons/biology/hormone.png'),
              pdfRoute: 'assets/pdf/Biology/hormonas.pdf',
            ),
            ContentArguments(
              title: 'Glicemia y Páncreas',
              img: AssetImage('assets/icons/biology/sugar.png'),
              pdfRoute: 'assets/pdf/Biology/pancreas.pdf',
            ),
          ],
        ),
        ThemeArguments(
          title: 'Herencia y Evolución',
          img: AssetImage('assets/img/bio3.jpg'),
          contents: <ContentArguments>[
            ContentArguments(
              title: 'Ciclo Celular',
              img: AssetImage('assets/icons/biology/cycle.png'),
              pdfRoute: 'assets/pdf/Biology/ciclo.pdf',
            ),
            ContentArguments(
              title: 'Mitosis',
              img: AssetImage('assets/icons/biology/mitosis.png'),
              pdfRoute: 'assets/pdf/Biology/mitosis.pdf',
            ),
            ContentArguments(
              title: 'Meosis',
              img: AssetImage('assets/icons/biology/esperm.png'),
              pdfRoute: 'assets/pdf/Biology/meiosis.pdf',
            ),
            ContentArguments(
              title: 'Genotipo - Fenotipo - Ambiente',
              img: AssetImage('assets/icons/biology/mariposa.png'),
              pdfRoute: 'assets/pdf/Biology/gfa.pdf',
            ),
            ContentArguments(
              title: 'Herencia Mendeliana y Sexual',
              img: AssetImage('assets/icons/biology/adn.png'),
              pdfRoute: 'assets/pdf/Biology/mendel.pdf',
            ),
            ContentArguments(
              title: 'Mutaciones Cromosómicas',
              img: AssetImage('assets/icons/biology/mutant.png'),
              pdfRoute: 'assets/pdf/Biology/mutaciones.pdf',
            ),
            ContentArguments(
              title: 'Cariogramas',
              img: AssetImage('assets/icons/biology/cromosoma.png'),
              pdfRoute: 'assets/pdf/Biology/cariogramas.pdf',
            ),
          ],
        ),
        ThemeArguments(
          title: 'Organismo y Ambiente',
          img: AssetImage('assets/img/bio4.jfif'),
          contents: <ContentArguments>[
            ContentArguments(
              title: 'Fotosíntesis',
              img: AssetImage('assets/icons/biology/foto.png'),
              pdfRoute: 'assets/pdf/Biology/fotosintesis.pdf',
            ),
            ContentArguments(
              title: 'Flujo de Energía',
              img: AssetImage('assets/icons/biology/energy.png'),
              pdfRoute: 'assets/pdf/Biology/energia.pdf',
            ),
            ContentArguments(
              title: 'Distribución y Abundancia',
              img: AssetImage('assets/icons/biology/earth.png'),
              pdfRoute: 'assets/pdf/Biology/dya.pdf',
            ),
            ContentArguments(
              title: 'Comunidades Ecológicas',
              img: AssetImage('assets/icons/biology/ecosystem.png'),
              pdfRoute: 'assets/pdf/Biology/comunidades.pdf',
            ),
            ContentArguments(
              title: 'Actividad Humana',
              img: AssetImage('assets/icons/biology/rubbish.png'),
              pdfRoute: 'assets/pdf/Biology/humanidad.pdf',
            ),
            ContentArguments(
              title: 'Sustentabilidad',
              img: AssetImage('assets/icons/biology/recycle.png'),
              pdfRoute: 'assets/pdf/Biology/sustentabilidad.pdf',
            ),
          ],
        ),
      ],
    ),
  );
}

Widget physics() {
  return CourseButton(
    CourseArguments(
      img: AssetImage('assets/icons/physics.png'),
      buttonsColor: Colors.purpleAccent[400],
      courseColor: Colors.purpleAccent,
      title: "Física",
      themes: <ThemeArguments>[
        ThemeArguments(
          title: 'Ondas',
          img: AssetImage('assets/img/phy1.jpg'),
          contents: <ContentArguments>[
            ContentArguments(
              title: 'Transmisión de Ondas',
              img: AssetImage('assets/icons/physics/waves.png'),
              pdfRoute: '',
            ),
            ContentArguments(
              title: 'Sonido y su Comportamiento',
              img: AssetImage('assets/icons/physics/sound.png'),
              pdfRoute: '',
            ),
            ContentArguments(
              title: 'Espectros',
              img: AssetImage('assets/icons/physics/espectro.png'),
              pdfRoute: '',
            ),
            ContentArguments(
              title: 'Espejos y Lentes',
              img: AssetImage('assets/icons/physics/espejo.png'),
              pdfRoute: '',
            ),
            ContentArguments(
              title: 'Ondas Sísmicas',
              img: AssetImage('assets/icons/physics/sismo.png'),
              pdfRoute: '',
            ),
            ContentArguments(
              title: 'Dispositivos',
              img: AssetImage('assets/icons/physics/telescopy.png'),
              pdfRoute: '',
            ),
          ],
        ),
        ThemeArguments(
          title: 'Mecánica',
          img: AssetImage('assets/img/phy2.jpg'),
          contents: <ContentArguments>[
            ContentArguments(
              title: 'Conceptós Básicos',
              img: AssetImage('assets/icons/physics/waves.png'),
              pdfRoute: '',
            ),
            ContentArguments(
              title: 'Movimiento Rectilíneo Uniforme',
              img: AssetImage('assets/icons/physics/mru.png'),
              pdfRoute: '',
            ),
            ContentArguments(
              title: 'Movimiento Rectilíneo Uniformemente Variado',
              img: AssetImage('assets/icons/physics/mruv.png'),
              pdfRoute: '',
            ),
            ContentArguments(
              title: 'Leyes de Kepler',
              img: AssetImage('assets/icons/physics/planet.png'),
              pdfRoute: '',
            ),
            ContentArguments(
              title: 'Leyes de Newton',
              img: AssetImage('assets/icons/physics/newton.png'),
              pdfRoute: '',
            ),
            ContentArguments(
              title: 'Dinámica y Tipos de Fuerza',
              img: AssetImage('assets/icons/physics/force.png'),
              pdfRoute: '',
            ),
            ContentArguments(
              title: 'Ley de Gravitación Universal',
              img: AssetImage('assets/icons/physics/planets.png'),
              pdfRoute: '',
            ),
            ContentArguments(
              title: 'Momentum Lineal e Impulso',
              img: AssetImage('assets/icons/physics/momentum.png'),
              pdfRoute: '',
            ),
            ContentArguments(
              title: 'Presión, Arquímedes y Pascal',
              img: AssetImage('assets/icons/physics/pressure.png'),
              pdfRoute: '',
            ),
          ],
        ),
        ThemeArguments(
          title: 'Energía',
          img: AssetImage('assets/img/phy3.jpg'),
          contents: <ContentArguments>[
            ContentArguments(
              title: 'Conservación de la Energía Mecánica',
              img: AssetImage('assets/icons/physics/waves.png'),
              pdfRoute: '',
            ),
            ContentArguments(
              title: 'Trabajo y Potencia',
              img: AssetImage('assets/icons/physics/waves.png'),
              pdfRoute: '',
            ),
            ContentArguments(
              title: 'Escalas Termométricas',
              img: AssetImage('assets/icons/physics/waves.png'),
              pdfRoute: '',
            ),
            ContentArguments(
              title: 'Dilatación Térmica',
              img: AssetImage('assets/icons/physics/waves.png'),
              pdfRoute: '',
            ),
            ContentArguments(
              title: 'Calor Latente y Cambios de Fase',
              img: AssetImage('assets/icons/physics/waves.png'),
              pdfRoute: '',
            ),
            ContentArguments(
              title: 'Transmisión de Calor',
              img: AssetImage('assets/icons/physics/waves.png'),
              pdfRoute: '',
            ),
            ContentArguments(
              title: 'Tectónica de Placas',
              img: AssetImage('assets/icons/physics/waves.png'),
              pdfRoute: '',
            ),
            ContentArguments(
              title: 'Cambio Climático y Efecto Invernadero',
              img: AssetImage('assets/icons/physics/waves.png'),
              pdfRoute: '',
            ),
          ],
        ),
        ThemeArguments(
          title: 'Electricidad y Magnetismo',
          img: AssetImage('assets/img/phy4.jpg'),
          contents: <ContentArguments>[
            ContentArguments(
              title: 'Ley de Ohm',
              img: AssetImage('assets/icons/physics/waves.png'),
              pdfRoute: '',
            ),
            ContentArguments(
              title: 'Ley de Coulomb',
              img: AssetImage('assets/icons/physics/waves.png'),
              pdfRoute: '',
            ),
            ContentArguments(
              title: 'Ley de Watt',
              img: AssetImage('assets/icons/physics/waves.png'),
              pdfRoute: '',
            ),
          ],
        ),
      ],
    ),
  );
}

Widget chemistry() {
  return CourseButton(
    CourseArguments(
      img: AssetImage('assets/icons/chemistry.png'),
      buttonsColor: Colors.lightGreen[400],
      courseColor: Colors.lightGreen,
      title: "Química",
      themes: <ThemeArguments>[
        ThemeArguments(
          title: 'Estructura Atómica',
          img: AssetImage('assets/img/chem1.jpg'),
          contents: <ContentArguments>[
            ContentArguments(
              title: 'La Materia',
              img: AssetImage("assets/icons/chemistry/mezcla.png"),
              pdfRoute: "assets/pdf/Chemistry/materia.pdf",
            ),
            ContentArguments(
              title: 'Cambios en la Materia',
              img: AssetImage("assets/icons/chemistry/procesos.png"),
              pdfRoute: "assets/pdf/Chemistry/procesos.pdf",
            ),
            ContentArguments(
              title: 'Modelos Atómicos',
              img: AssetImage("assets/icons/chemistry/atom.png"),
              pdfRoute: "assets/pdf/Chemistry/modelos.pdf",
            ),
            ContentArguments(
              title: 'Conceptos Preliminares',
              img: AssetImage("assets/icons/chemistry/bioquimico.png"),
              pdfRoute: "assets/pdf/Chemistry/conceptos.pdf",
            ),
            ContentArguments(
              title: 'Sistema Periódico',
              img: AssetImage("assets/icons/chemistry/pt.png"),
              pdfRoute: "assets/pdf/Chemistry/sistema.pdf",
            ),
          ],
        ),
        ThemeArguments(
          title: 'Química Orgánica',
          img: AssetImage('assets/img/chem2.jpg'),
        ),
        ThemeArguments(
          title: 'Reacciones químicas y Estequiometría',
          img: AssetImage('assets/img/chem3.jpg'),
        ),
      ],
    ),
  );
}
