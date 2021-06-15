import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:ptucontenidos/providers/ad_state.dart';
import 'package:ptucontenidos/providers/arguments.dart';
import 'package:ptucontenidos/utils/texts.dart';
import 'package:ptucontenidos/widgets/content_button.dart';

class ThemePage extends StatefulWidget {
  ThemePage();

  @override
  _ThemePageState createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
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
          size: AdSize.mediumRectangle,
          request: AdRequest(),
          listener: adState.adListener,
        )..load();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final List settings = ModalRoute.of(context).settings.arguments;
    final ThemeArguments theme = settings[0];
    final Color color = settings[1];
    double size = MediaQuery.of(context).size.aspectRatio;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(theme.title, style: styles.getSubtitle(context)),
        centerTitle: true,
        toolbarHeight: h * 0.1,
        backgroundColor: color,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: createButtons(theme, color),
      ),
    );
  }

  List<Widget> createButtons(ThemeArguments args, Color c) {
    double h = MediaQuery.of(context).size.height;

    List<Widget> buttons = [
      if (banner == null)
        Container()
      else
        Container(
          height: h * 0.4,
          child: AdWidget(
            ad: banner,
          ),
        ),
    ];

    args.contents.forEach(
      (e) {
        Widget _temp = ContentButton(settings: e, color: c);
        buttons.add(_temp);
      },
    );

    return buttons;
  }
}
