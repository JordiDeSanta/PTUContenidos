import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:pdf_render/pdf_render_widgets.dart';
import 'package:ptucontenidos/providers/arguments.dart';

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
}
