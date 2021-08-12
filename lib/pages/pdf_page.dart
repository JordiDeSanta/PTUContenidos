import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:provider/provider.dart';
import 'package:ptucontenidos/providers/ad_state.dart';
import 'package:ptucontenidos/providers/arguments.dart';
import 'package:url_launcher/url_launcher.dart';

class PDFPage extends StatefulWidget {
  @override
  _PDFPageState createState() => _PDFPageState();
}

class _PDFPageState extends State<PDFPage> {
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
    final List settings = ModalRoute.of(context).settings.arguments;
    final ContentArguments content = settings[0];
    final Color color = settings[1];
    double size = MediaQuery.of(context).size.aspectRatio;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: new AppBar(
        title: Text(content.title),
        backgroundColor: color,
        toolbarHeight: size * 140,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _launchURL(content),
            icon: Icon(Icons.ondemand_video_rounded),
          ),
        ],
      ),
      backgroundColor: Colors.grey,
      body: Container(child: SfPdfViewer.asset(content.pdfRoute)),
      bottomSheet: Stack(
        children: [
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

  void _launchURL(ContentArguments c) async {
    final _url = c.vidUrl;
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  }
}
