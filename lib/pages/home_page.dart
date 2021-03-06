import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:sciencenotes/providers/ad_state.dart';
import 'package:sciencenotes/providers/arguments.dart';
import 'package:sciencenotes/utils/texts.dart';
import 'package:sciencenotes/widgets/course_button.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final styles = TextStyles();

  BannerAd? banner;

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
        title: Text('Science Notes', style: styles.getTitle(context)),
        centerTitle: true,
        toolbarHeight: h * 0.1,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.white,
      bottomSheet: Stack(
        children: [
          if (banner == null)
            Container()
          else
            Container(
              height: h * 0.2,
              child: AdWidget(
                ad: banner!,
              ),
            ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 5),
          biology(),
          physics(),
          chemistry(),
          history(),
          SizedBox(height: h * 0.3),
        ],
      ),
    );
  }
}

Widget biology() {
  return CourseButton(
    CourseArguments(
      creatorLink: 'https://www.instagram.com/jord1dev/?hl=es-la',
      pRoute: 'assets/pdf/Biology/pauta.pdf',
      img: AssetImage('assets/icons/biology.png'),
      buttonsColor: Colors.greenAccent,
      courseColor: Colors.greenAccent[400],
      title: "Biolog??a",
      themes: <ThemeArguments>[
        ThemeArguments(
          title: 'Organizaci??n, Estructura y Actividad Celular',
          img: AssetImage('assets/img/bio1.jpeg'),
          contents: <ContentArguments>[
            ContentArguments(
              title: 'Organelos de las C??lulas',
              img: AssetImage('assets/icons/biology/celula.png'),
              pdfRoute: 'assets/pdf/Biology/celulas.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bH4vXE1hX_NwKoyXsa_W2rc',
            ),
            ContentArguments(
              title: 'Tipos Celulares',
              img: AssetImage('assets/icons/biology/tipos.png'),
              pdfRoute: 'assets/pdf/Biology/tipos.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bEs3N5sWIjKe3IV9Jql-gWg',
            ),
            ContentArguments(
              title: 'Transportes en la Membrana',
              img: AssetImage('assets/icons/biology/membrane.png'),
              pdfRoute: 'assets/pdf/Biology/membrana.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bG_Tto1pXKKS_l2aDLsztVf',
            ),
          ],
        ),
        ThemeArguments(
          title: 'Procesos y Funciones Biol??gicas',
          img: AssetImage('assets/img/bio2.jpg'),
          contents: <ContentArguments>[
            ContentArguments(
              title: 'Sexualidad y Pubertad',
              img: AssetImage('assets/icons/biology/sexuality.png'),
              pdfRoute: 'assets/pdf/Biology/sex.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bFikIId65VmYeCVq_5oeeSr',
            ),
            ContentArguments(
              title: 'Ciclo Ov??rico',
              img: AssetImage('assets/icons/biology/uterus.png'),
              pdfRoute: 'assets/pdf/Biology/ovarico.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bHbxlbgmqy6OZXeCPv3sABK',
            ),
            ContentArguments(
              title: 'Embarazo y Lactancia',
              img: AssetImage('assets/icons/biology/mother.png'),
              pdfRoute: 'assets/pdf/Biology/embarazo.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bFsdLaze_a9bYjlr_Lwkq_u',
            ),
            ContentArguments(
              title: 'Control de Natalidad',
              img: AssetImage('assets/icons/biology/baby.png'),
              pdfRoute: 'assets/pdf/Biology/natalidad.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bHcfDuhRcMfHo7nrGS4s6-P',
            ),
            ContentArguments(
              title: 'ITS',
              img: AssetImage('assets/icons/biology/its.png'),
              pdfRoute: 'assets/pdf/Biology/its.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bHMzB5VoFjWfd9XieubE0Qj',
            ),
            ContentArguments(
              title: 'Nutrientes y Biomol??culas',
              img: AssetImage('assets/icons/biology/protein.png'),
              pdfRoute: 'assets/pdf/Biology/biomol.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bHX9C1-p6M9aY3w9lUsRmLF',
            ),
            ContentArguments(
              title: 'Hormonas',
              img: AssetImage('assets/icons/biology/hormone.png'),
              pdfRoute: 'assets/pdf/Biology/hormonas.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bE7Nr-f_61EpfGACllFfa4r',
            ),
            ContentArguments(
              title: 'Glicemia y P??ncreas',
              img: AssetImage('assets/icons/biology/sugar.png'),
              pdfRoute: 'assets/pdf/Biology/pancreas.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bHdPWxS1Z8rpm1xIvKr7tKq',
            ),
          ],
        ),
        ThemeArguments(
          title: 'Herencia y Evoluci??n',
          img: AssetImage('assets/img/bio3.jpg'),
          contents: <ContentArguments>[
            ContentArguments(
              title: 'Ciclo Celular',
              img: AssetImage('assets/icons/biology/cycle.png'),
              pdfRoute: 'assets/pdf/Biology/ciclo.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bH9DsBAMlE4s-ILKrqRBg6-',
            ),
            ContentArguments(
              title: 'Mitosis',
              img: AssetImage('assets/icons/biology/mitosis.png'),
              pdfRoute: 'assets/pdf/Biology/mitosis.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bGa-jpZle5g0XSndRSo5Ezx',
            ),
            ContentArguments(
              title: 'Meiosis',
              img: AssetImage('assets/icons/biology/esperm.png'),
              pdfRoute: 'assets/pdf/Biology/meiosis.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bE8TP78ySkdS-ZVeYo9Eawm',
            ),
            ContentArguments(
              title: 'Genotipo - Fenotipo - Ambiente',
              img: AssetImage('assets/icons/biology/mariposa.png'),
              pdfRoute: 'assets/pdf/Biology/gfa.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bGjnBrt_FupUvhXxnR9G1-O',
            ),
            ContentArguments(
              title: 'Herencia Mendeliana y Sexual',
              img: AssetImage('assets/icons/biology/adn.png'),
              pdfRoute: 'assets/pdf/Biology/mendel.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bEkN3Ne38ce2zuFQI1C_9T3',
            ),
            ContentArguments(
              title: 'Mutaciones Cromos??micas',
              img: AssetImage('assets/icons/biology/mutant.png'),
              pdfRoute: 'assets/pdf/Biology/mutaciones.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bHbgiwm8ypAM_zVxJIROC1M',
            ),
            ContentArguments(
              title: 'Cariogramas',
              img: AssetImage('assets/icons/biology/cromosoma.png'),
              pdfRoute: 'assets/pdf/Biology/cariogramas.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bEnzOV7ImBH-qjmBpKyylnp',
            ),
          ],
        ),
        ThemeArguments(
          title: 'Organismo y Ambiente',
          img: AssetImage('assets/img/bio4.jfif'),
          contents: <ContentArguments>[
            ContentArguments(
              title: 'Fotos??ntesis',
              img: AssetImage('assets/icons/biology/foto.png'),
              pdfRoute: 'assets/pdf/Biology/fotosintesis.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bGmh-gcoEe6OIA927LVKsok',
            ),
            ContentArguments(
              title: 'Flujo de Energ??a',
              img: AssetImage('assets/icons/biology/energy.png'),
              pdfRoute: 'assets/pdf/Biology/energia.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bGaKmcMd6hGnefa_DbOAnuu',
            ),
            ContentArguments(
              title: 'Distribuci??n y Abundancia',
              img: AssetImage('assets/icons/biology/earth.png'),
              pdfRoute: 'assets/pdf/Biology/dya.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bFMLCYxVS1fVSHekQ3ODvEA',
            ),
            ContentArguments(
              title: 'Comunidades Ecol??gicas',
              img: AssetImage('assets/icons/biology/ecosystem.png'),
              pdfRoute: 'assets/pdf/Biology/comunidades.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bHX7Dx9gjnMkx1hHuBVkfB9',
            ),
            ContentArguments(
              title: 'Actividad Humana',
              img: AssetImage('assets/icons/biology/rubbish.png'),
              pdfRoute: 'assets/pdf/Biology/humanidad.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bEzC9lIouHmRcyv7jECj00f',
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
      creatorLink: 'https://www.instagram.com/jord1dev/?hl=es-la',
      pRoute: 'assets/pdf/Physics/pauta.pdf',
      img: AssetImage('assets/icons/physics.png'),
      buttonsColor: Colors.purpleAccent[400],
      courseColor: Colors.purpleAccent,
      title: "F??sica",
      themes: <ThemeArguments>[
        ThemeArguments(
          title: 'Ondas',
          img: AssetImage('assets/img/phy1.jpg'),
          contents: <ContentArguments>[
            ContentArguments(
              title: 'Transmisi??n de Ondas',
              img: AssetImage('assets/icons/physics/waves.png'),
              pdfRoute: 'assets/pdf/Physics/ondas.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bH9m8I0UIHvD88VoGgIwMnL',
            ),
            ContentArguments(
              title: 'Sonido y su Comportamiento',
              img: AssetImage('assets/icons/physics/sound.png'),
              pdfRoute: 'assets/pdf/Physics/sonido.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bHUxaf0fkF3tgGO9Lv5h1nL',
            ),
            ContentArguments(
              title: 'Espectros',
              img: AssetImage('assets/icons/physics/espectro.png'),
              pdfRoute: 'assets/pdf/Physics/espectros.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bEt1WL1qSfxf3tJjx4fC0ni',
            ),
            ContentArguments(
              title: 'Luz y su Comportamiento',
              img: AssetImage('assets/icons/physics/luz.png'),
              pdfRoute: 'assets/pdf/Physics/luz.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bE5fNiVhiiDluqZbFKFvUV6',
            ),
            ContentArguments(
              title: 'Espejos y Lentes',
              img: AssetImage('assets/icons/physics/espejo.png'),
              pdfRoute: 'assets/pdf/Physics/espejoslentes.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bF0rdqEL44uf0CrQy0laRH8',
            ),
            ContentArguments(
              title: 'Ondas S??smicas',
              img: AssetImage('assets/icons/physics/sismo.png'),
              pdfRoute: 'assets/pdf/Physics/sismicas.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bGCGEmE41pd6mg5rieBp11a',
            ),
            ContentArguments(
              title: 'Dispositivos',
              img: AssetImage('assets/icons/physics/telescopy.png'),
              pdfRoute: 'assets/pdf/Physics/dispositivos.pdf',
            ),
          ],
        ),
        ThemeArguments(
          title: 'Mec??nica',
          img: AssetImage('assets/img/phy2.jpg'),
          contents: <ContentArguments>[
            ContentArguments(
              title: 'Concept??s B??sicos',
              img: AssetImage('assets/icons/physics/book.png'),
              pdfRoute: 'assets/pdf/Physics/conceptos.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bFdz4lF5IEQKtcBAws6-wj3',
            ),
            ContentArguments(
              title: 'Movimiento Rectil??neo Uniforme',
              img: AssetImage('assets/icons/physics/mru.png'),
              pdfRoute: 'assets/pdf/Physics/mru.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bEELQdDWMvdR97UziO3i3_y',
            ),
            ContentArguments(
              title: 'Movimiento Rectil??neo Uniformemente Variado',
              img: AssetImage('assets/icons/physics/mruv.png'),
              pdfRoute: 'assets/pdf/Physics/mruv.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bEDJIadnQKRCDZHmyesmYiO',
            ),
            ContentArguments(
              title: 'Leyes de Kepler',
              img: AssetImage('assets/icons/physics/planet.png'),
              pdfRoute: 'assets/pdf/Physics/kepler.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bHcLUuwTL_hpBlAfPn_nbdx',
            ),
            ContentArguments(
              title: 'Leyes de Newton',
              img: AssetImage('assets/icons/physics/newton.png'),
              pdfRoute: 'assets/pdf/Physics/newton.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bHzcZSYlkMhkZgGl27kO1z9',
            ),
            ContentArguments(
              title: 'Din??mica y Tipos de Fuerza',
              img: AssetImage('assets/icons/physics/force.png'),
              pdfRoute: 'assets/pdf/Physics/dinamica.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bEGkZ7DymT1smwek8TQkKvE',
            ),
            ContentArguments(
              title: 'Ley de Gravitaci??n Universal',
              img: AssetImage('assets/icons/physics/planets.png'),
              pdfRoute: 'assets/pdf/Physics/gravitacion.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bG1B5gOs25WzJAKX30rThWd',
            ),
            ContentArguments(
              title: 'Momentum Lineal e Impulso',
              img: AssetImage('assets/icons/physics/momentum.png'),
              pdfRoute: 'assets/pdf/Physics/momentum.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bEhwvscOtfhFfPb1uzI6FdR',
            ),
            ContentArguments(
              title: 'Presi??n, Arqu??medes y Pascal',
              img: AssetImage('assets/icons/physics/pressure.png'),
              pdfRoute: 'assets/pdf/Physics/hidro.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bERJnTZlf8BVpNKvqFaUUTa',
            ),
          ],
        ),
        ThemeArguments(
          title: 'Energ??a',
          img: AssetImage('assets/img/phy3.jpg'),
          contents: <ContentArguments>[
            ContentArguments(
              title: 'Conservaci??n de la Energ??a Mec??nica',
              img: AssetImage('assets/icons/physics/energy.png'),
              pdfRoute: 'assets/pdf/Physics/emecanica.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bEcEX7-siX4qbhMkE9pP_8_',
            ),
            ContentArguments(
              title: 'Trabajo y Potencia',
              img: AssetImage('assets/icons/physics/power.png'),
              pdfRoute: 'assets/pdf/Physics/trabypot.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bFCHRQkmF2zfAcosn37P4b0',
            ),
            ContentArguments(
              title: 'Escalas Termom??tricas',
              img: AssetImage('assets/icons/physics/escala.png'),
              pdfRoute: 'assets/pdf/Physics/escalas.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bExO6zHFS9HNR6g6r9oTS69',
            ),
            ContentArguments(
              title: 'Dilataci??n T??rmica',
              img: AssetImage('assets/icons/physics/termo.png'),
              pdfRoute: 'assets/pdf/Physics/dilatacion.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bHAry-QFb6bUj3WXmRslbDx',
            ),
            ContentArguments(
              title: 'Calor Latente y Cambios de Fase',
              img: AssetImage('assets/icons/physics/ice.png'),
              pdfRoute: 'assets/pdf/Physics/latente.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bFEOfeolD9qzJUNm1Tk-QZH',
            ),
            ContentArguments(
              title: 'Transmisi??n de Calor',
              img: AssetImage('assets/icons/physics/heat.png'),
              pdfRoute: 'assets/pdf/Physics/calor.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bGcqfbj_Ipzj-F0HgagrN2u',
            ),
            ContentArguments(
              title: 'Tect??nica de Placas',
              img: AssetImage('assets/icons/physics/geo.png'),
              pdfRoute: 'assets/pdf/Physics/tectonica.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bFlwtAOWeWB_0m2tGLDwQsP',
            ),
            ContentArguments(
              title: 'Cambio Clim??tico y Efecto Invernadero',
              img: AssetImage('assets/icons/physics/pol.png'),
              pdfRoute: 'assets/pdf/Physics/clima.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bF31dXHvh-olI1gekpMjYdb',
            ),
          ],
        ),
        ThemeArguments(
          title: 'Electricidad y Magnetismo',
          img: AssetImage('assets/img/phy4.jpg'),
          contents: <ContentArguments>[
            ContentArguments(
              title: 'Electrizaci??n',
              img: AssetImage('assets/icons/physics/enchufe.png'),
              pdfRoute: 'assets/pdf/Physics/electrizacion.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bFiVDoRK4XB83D4uE2yUg81',
            ),
            ContentArguments(
              title: 'Ley de Ohm',
              img: AssetImage('assets/icons/physics/ohm.png'),
              pdfRoute: 'assets/pdf/Physics/ohm.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bH33v8t5erXTu6QAOkjpaZn',
            ),
            ContentArguments(
              title: 'Ley de Coulomb',
              img: AssetImage('assets/icons/physics/coulomb.png'),
              pdfRoute: 'assets/pdf/Physics/coulomb.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bG0Jxe2JwTORpfcIRoXENqi',
            ),
            ContentArguments(
              title: 'Ley de Watt',
              img: AssetImage('assets/icons/physics/ammeter.png'),
              pdfRoute: 'assets/pdf/Physics/watt.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bGam_2NXmnzQlEYJgNI8lj-',
            ),
            ContentArguments(
              title: 'Magnetismo',
              img: AssetImage('assets/icons/physics/magnetismo.png'),
              pdfRoute: 'assets/pdf/Physics/magnetismo.pdf',
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bG6i_Th2OvbV42mGOGecwKE',
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
      creatorLink: 'https://www.instagram.com/jord1dev/?hl=es-la',
      pRoute: 'assets/pdf/Chemistry/pauta.pdf',
      img: AssetImage('assets/icons/chemistry.png'),
      buttonsColor: Colors.lightGreen[400],
      courseColor: Colors.lightGreen,
      title: "Qu??mica",
      themes: <ThemeArguments>[
        ThemeArguments(
          title: 'Estructura At??mica',
          img: AssetImage('assets/img/chem1.jpg'),
          contents: <ContentArguments>[
            ContentArguments(
              title: 'La Materia',
              img: AssetImage("assets/icons/chemistry/mezcla.png"),
              pdfRoute: "assets/pdf/Chemistry/materia.pdf",
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bFCrgafDIh6JpcEHn5AQ6e9',
            ),
            ContentArguments(
              title: 'Cambios en la Materia',
              img: AssetImage("assets/icons/chemistry/procesos.png"),
              pdfRoute: "assets/pdf/Chemistry/procesos.pdf",
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bFXoV3_Cxiw6ULHUun-4Y26',
            ),
            ContentArguments(
              title: 'Modelos At??micos',
              img: AssetImage("assets/icons/chemistry/atom.png"),
              pdfRoute: "assets/pdf/Chemistry/modelos.pdf",
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bHyXZux6H-BgWiOMt-ql50z',
            ),
            ContentArguments(
              title: 'Conceptos Preliminares',
              img: AssetImage("assets/icons/chemistry/bioquimico.png"),
              pdfRoute: "assets/pdf/Chemistry/conceptos.pdf",
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bFPA1Z5ATvCqDNqHIqWAJYi',
            ),
            ContentArguments(
              title: 'Sistema Peri??dico',
              img: AssetImage("assets/icons/chemistry/pt.png"),
              pdfRoute: "assets/pdf/Chemistry/sistema.pdf",
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bEYbyA2DYp2gLl6mN5Rgd0M',
            ),
            ContentArguments(
                title: 'Enlaces Qu??micos',
                img: AssetImage("assets/icons/chemistry/molecular.png"),
                pdfRoute: "assets/pdf/Chemistry/enlaces.pdf",
                vidUrl:
                    'https://www.youtube.com/playlist?list=PLcuHdQcnp6bGhoaxrujPTtr-vrjMFpYJS'),
            ContentArguments(
              title: 'Estructura de Lewis',
              img: AssetImage("assets/icons/chemistry/lewis.png"),
              pdfRoute: "assets/pdf/Chemistry/lewis.pdf",
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bGBOAKuMUd0dRT2iIR8kxTW',
            ),
          ],
        ),
        ThemeArguments(
          title: 'Qu??mica Org??nica',
          img: AssetImage('assets/img/chem2.jpg'),
          contents: <ContentArguments>[
            ContentArguments(
              title: 'Carbono y sus Propiedades',
              img: AssetImage("assets/icons/chemistry/carbon.png"),
              pdfRoute: "assets/pdf/Chemistry/carbono.pdf",
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bF9XBVXmF3urUF8y3ocUEEu',
            ),
            ContentArguments(
              title: 'Modelos y F??rmulas',
              img: AssetImage("assets/icons/chemistry/formula.png"),
              pdfRoute: "assets/pdf/Chemistry/modelos.pdf",
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bESwhgR1qYBLMkuLKWrhzmk',
            ),
            ContentArguments(
              title: 'Grupos Funcionales',
              img: AssetImage("assets/icons/chemistry/sust.png"),
              pdfRoute: "assets/pdf/Chemistry/grupos.pdf",
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bH3e163Eu1uzQ_iJ-7apUo3',
            ),
            ContentArguments(
              title: 'Nomenclatura de Org??nicos',
              img: AssetImage("assets/icons/chemistry/nom.png"),
              pdfRoute: "assets/pdf/Chemistry/organicos.pdf",
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bFKCvwEm7IGQwx8IibjCG3z',
            ),
          ],
        ),
        ThemeArguments(
          title: 'Reacciones qu??micas y Estequiometr??a',
          img: AssetImage('assets/img/chem3.jpg'),
          contents: <ContentArguments>[
            ContentArguments(
              title: 'Gases',
              img: AssetImage("assets/icons/chemistry/gas.png"),
              pdfRoute: "assets/pdf/Chemistry/gases.pdf",
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bElSNo7venSUrlYO33J2RxD',
            ),
            ContentArguments(
              title: 'Conceptos Moleculares',
              img: AssetImage("assets/icons/chemistry/water.png"),
              pdfRoute: "assets/pdf/Chemistry/moleculares.pdf",
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bGTizuWSL-U_8YbtpHBjyf_',
            ),
            ContentArguments(
              title: 'Qu??mica Cuantitativa',
              img: AssetImage("assets/icons/chemistry/inorganic.png"),
              pdfRoute: "assets/pdf/Chemistry/cuantitativa.pdf",
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bFSqfHjwGGsB7pQQReAlirk',
            ),
            ContentArguments(
              title: 'Leyes Qu??micas',
              img: AssetImage("assets/icons/chemistry/leyes.png"),
              pdfRoute: "assets/pdf/Chemistry/leyes.pdf",
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bH5kxMl0xZ-lSTCpHNVoAiR',
            ),
            ContentArguments(
              title: 'An??lisis Porcentual',
              img: AssetImage("assets/icons/chemistry/percentage.png"),
              pdfRoute: "assets/pdf/Chemistry/porcentual.pdf",
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bHTDwC34FjNe5UhNS-2wKHh',
            ),
            ContentArguments(
              title: 'Reactivo Limitante',
              img: AssetImage("assets/icons/chemistry/sol.png"),
              pdfRoute: "assets/pdf/Chemistry/reactivos.pdf",
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bHYrKPIss0qjj9tqVSVdm6n',
            ),
            ContentArguments(
              title: 'Soluciones',
              img: AssetImage("assets/icons/chemistry/flask.png"),
              pdfRoute: "assets/pdf/Chemistry/soluciones.pdf",
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bGAvYHIlHpPRkXwnJhBayZA',
            ),
            ContentArguments(
              title: 'Concentraciones',
              img: AssetImage("assets/icons/chemistry/concentracion.png"),
              pdfRoute: "assets/pdf/Chemistry/concentracion.pdf",
              vidUrl:
                  'https://www.youtube.com/playlist?list=PLcuHdQcnp6bGZCjQa0cSY8BEYWbYAoWww',
            ),
          ],
        ),
      ],
    ),
  );
}

Widget history() {
  return CourseButton(
    CourseArguments(
      creatorLink: 'https://www.instagram.com/study.catam/?hl=es-la',
      pRoute: 'assets/pdf/History/pauta.pdf',
      img: AssetImage('assets/icons/history.png'),
      buttonsColor: Colors.yellowAccent[400],
      courseColor: Colors.yellowAccent[700],
      title: "Historia",
      themes: <ThemeArguments>[
        ThemeArguments(
          title: 'Cambio del siglo XIX en Europa, Am??rica y Chile',
          img: AssetImage('assets/img/his1.jpg'),
          contents: <ContentArguments>[
            ContentArguments(
              title: 'Ideas Liberales y Republicanas',
              img: AssetImage("assets/icons/history/idea.png"),
              pdfRoute: "assets/pdf/History/ideas.pdf",
            ),
            ContentArguments(
              title: 'Cultura Burguesa',
              img: AssetImage("assets/icons/history/bur.png"),
              pdfRoute: "assets/pdf/History/burgues.pdf",
            ),
            ContentArguments(
              title: 'Impacto del Estado Naci??n',
              img: AssetImage("assets/icons/history/estado.png"),
              pdfRoute: "assets/pdf/History/estadonacion.pdf",
            ),
            ContentArguments(
              title: 'Progreso Indefinido',
              img: AssetImage("assets/icons/history/progreso.png"),
              pdfRoute: "assets/pdf/History/progreso.pdf",
            ),
            ContentArguments(
              title: 'Imperialismo',
              img: AssetImage("assets/icons/history/trono.png"),
              pdfRoute: "assets/pdf/History/imperialismo.pdf",
            ),
          ],
        ),
        ThemeArguments(
          title: 'Chile durante el Siglo XIX',
          img: AssetImage('assets/img/his2.jpg'),
          contents: <ContentArguments>[
            ContentArguments(
              title: 'Chile',
              img: AssetImage("assets/icons/history/chile.png"),
              pdfRoute: "assets/pdf/History/chile.pdf",
            ),
            ContentArguments(
              title: 'Territorio Chileno',
              img: AssetImage("assets/icons/history/territorio.png"),
              pdfRoute: "assets/pdf/History/territorio.pdf",
            ),
            ContentArguments(
              title: 'Pol??tica Chilena',
              img: AssetImage("assets/icons/history/politica.png"),
              pdfRoute: "assets/pdf/History/politica.pdf",
            ),
            ContentArguments(
              title: 'Auge Salitrero',
              img: AssetImage("assets/icons/history/salitre.png"),
              pdfRoute: "assets/pdf/History/salitre.pdf",
            ),
          ],
        ),
        ThemeArguments(
          title: 'Primera Mitad del Siglo XX',
          img: AssetImage('assets/img/his3.jpeg'),
          contents: <ContentArguments>[
            ContentArguments(
              title: 'Impacto de la Primera Guerra Mundial',
              img: AssetImage("assets/icons/history/primera.png"),
              pdfRoute: "assets/pdf/History/primera.pdf",
            ),
            ContentArguments(
              title: 'Periodo Entreguerras',
              img: AssetImage("assets/icons/history/entre.png"),
              pdfRoute: "assets/pdf/History/entre.pdf",
            ),
            ContentArguments(
              title: 'Crisis del Parlamentarismo',
              img: AssetImage("assets/icons/history/parlamentarismo.png"),
              pdfRoute: "assets/pdf/History/parlamentarismo.pdf",
            ),
            ContentArguments(
              title: 'Gran Depresi??n',
              img: AssetImage("assets/icons/history/depresion.png"),
              pdfRoute: "assets/pdf/History/depresion.pdf",
            ),
            ContentArguments(
              title: 'Segunda Guerra Mundial',
              img: AssetImage("assets/icons/history/segunda.png"),
              pdfRoute: "assets/pdf/History/segunda.pdf",
            ),
          ],
        ),
        ThemeArguments(
          title: 'Segunda Mitad del Siglo XX',
          img: AssetImage('assets/img/his4.jpg'),
          contents: <ContentArguments>[
            ContentArguments(
              title: 'Guerra Fr??a',
              img: AssetImage("assets/icons/history/fria.png"),
              pdfRoute: "assets/pdf/History/fria.pdf",
            ),
            ContentArguments(
              title: 'Guerra Fr??a en Am??rica Latina',
              img: AssetImage("assets/icons/history/latino.png"),
              pdfRoute: "assets/pdf/History/latin.pdf",
            ),
            ContentArguments(
              title: 'Guerra Fr??a en Chile',
              img: AssetImage("assets/icons/history/chile.png"),
              pdfRoute: "assets/pdf/History/chilegf.pdf",
            ),
            ContentArguments(
              title: 'Fin de la Guerra Fr??a',
              img: AssetImage("assets/icons/history/fin.png"),
              pdfRoute: "assets/pdf/History/fin.pdf",
            ),
            ContentArguments(
              title: 'Golpe de Estado',
              img: AssetImage("assets/icons/history/dictadura.png"),
              pdfRoute: "assets/pdf/History/golpe1.pdf",
            ),
            ContentArguments(
              title: 'Regreso a la Democracia',
              img: AssetImage("assets/icons/history/votar.png"),
              pdfRoute: "assets/pdf/History/golpe2.pdf",
            ),
          ],
        ),
      ],
    ),
  );
}

Widget fButton(BuildContext context, TextStyles styles, Color c, String r,
    String u, String t) {
  double size = MediaQuery.of(context).size.aspectRatio;

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
        backgroundColor: MaterialStateProperty.all(c),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: size * 40),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              height: size * 180,
              image: AssetImage(r),
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.only(left: size * 40),
              width: size * 400,
              child: Text(
                t,
                style: styles.getTitle(context),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
      onPressed: () {
        _launchURL(u);
      },
    ),
  );
}

void _launchURL(String url) async {
  await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
