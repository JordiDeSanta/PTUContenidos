import 'package:flutter/material.dart';
import 'package:pdf_render/pdf_render_widgets.dart';
import 'package:ptucontenidos/providers/arguments.dart';
import 'package:url_launcher/url_launcher.dart';

class PDFPage extends StatefulWidget {
  @override
  _PDFPageState createState() => _PDFPageState();
}

class _PDFPageState extends State<PDFPage> {
  final controller = PdfViewerController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List settings = ModalRoute.of(context).settings.arguments;
    final ContentArguments content = settings[0];
    final Color color = settings[1];
    double size = MediaQuery.of(context).size.aspectRatio;

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
      body: PdfViewer.openAsset(
        content.pdfRoute,
        viewerController: controller,
        onError: (err) => print(err),
        params: PdfViewerParams(
          padding: 5,
          minScale: 1.0,
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.first_page),
            onPressed: () => controller.ready?.goToPage(pageNumber: 1),
          ),
          SizedBox(height: 5),
          FloatingActionButton(
            child: Icon(Icons.last_page),
            onPressed: () =>
                controller.ready?.goToPage(pageNumber: controller.pageCount),
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
