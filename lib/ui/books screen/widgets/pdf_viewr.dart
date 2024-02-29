import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// ignore: must_be_immutable
class PDFViewr extends StatelessWidget {
  String assetPath;
  PDFViewr({super.key,required this.assetPath});

  @override
  Widget build(BuildContext context) {
    String args = ModalRoute.of(context)!.settings.arguments as String;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(args),
          centerTitle: true,
        ),
        body: SfPdfViewer.asset(assetPath,
        canShowPaginationDialog: true,
        pageSpacing: 2.0,
        )
      ),
    );
  }
}
