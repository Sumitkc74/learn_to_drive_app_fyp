import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:first_app/utils/widgets/screens_app_bar.dart';

class PdfReaderScreen extends StatelessWidget {
  final String title;
  final String url;

  const PdfReaderScreen({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  Future<void> launchInBrowser(String url) async {
    try {
      final Uri toLaunch = Uri.parse(url);
      await launchUrl(toLaunch, mode: LaunchMode.externalApplication);
    } catch (e) {
      log("Could not launch ------->");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar : ScreensAppBar(
          title: title,
          onPressed: (){
            Get.back();
          },
          action: IconButton(
            icon: const Icon(
              Icons.download,
              color: Colors.black,
            ),
            onPressed: () {
              launchInBrowser(url);
            },
          )
        ),
        
        body : SfPdfViewer.network(url), 
      ),
    );
  }
}