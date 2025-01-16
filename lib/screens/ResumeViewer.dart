import 'package:flutter/material.dart';

import 'package:pdfx/pdfx.dart';

class PdfViewerPage extends StatelessWidget {
  // final String url;

  final String testUrl;

  const PdfViewerPage({super.key, required this.testUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Viewer"),
      ),
      body: Center(
        child: PdfView(
          controller: PdfController(
            document: PdfDocument.openAsset(testUrl),
          
          ),
        ),
      ),
    );
  }
}
