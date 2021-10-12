import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class paginaweb extends StatefulWidget {
  final String url;
  const paginaweb(this.url);
  @override
  _paginawebState createState() => _paginawebState();
}

class _paginawebState extends State<paginaweb> {
  @override
  Widget build(BuildContext context) {
    return WebView(initialUrl: widget.url);
  }
}
