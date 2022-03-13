import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CardAdd extends StatefulWidget {
  final String url;
  const CardAdd({Key? key,required this.url}) : super(key: key);

  @override
  _CardAddState createState() => _CardAddState();
}

class _CardAddState extends State<CardAdd> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Добавить карту"),
      ),
      body:  WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: widget.url,
      ),
    );
  }
}
