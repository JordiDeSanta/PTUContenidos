import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:ptucontenidos/providers/ad_state.dart';
import 'package:ptucontenidos/providers/arguments.dart';
import 'package:ptucontenidos/utils/texts.dart';
import 'package:ptucontenidos/widgets/theme_button.dart';

class CoursePage extends StatefulWidget {
  CoursePage();

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
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
          size: AdSize.banner,
          request: AdRequest(),
          listener: adState.adListener,
        )..load();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    final CourseArguments settings = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(settings.title, style: styles.getTitle(context)),
        centerTitle: true,
        toolbarHeight: h * 0.1,
        backgroundColor: settings.courseColor,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Table(
            children: [
              TableRow(
                children: [
                  ThemeButton(
                    settings: settings.themes[0],
                    color: settings.buttonsColor,
                  ),
                  ThemeButton(
                    settings: settings.themes[1],
                    color: settings.buttonsColor,
                  ),
                ],
              ),
              TableRow(
                children: [
                  ThemeButton(
                    settings: settings.themes[2],
                    color: settings.buttonsColor,
                  ),
                  settings.themes.length == 4
                      ? ThemeButton(
                          settings: settings.themes[3],
                          color: settings.buttonsColor,
                        )
                      : Container(),
                ],
              )
            ],
          ),
          if (banner == null)
            Container()
          else
            Container(
              height: h * 0.1,
              child: AdWidget(
                ad: banner,
              ),
            ),
        ],
      ),
    );
  }
}
