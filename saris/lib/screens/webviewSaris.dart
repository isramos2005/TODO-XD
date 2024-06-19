// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, file_names, unused_local_variable, camel_case_types, import_of_legacy_library_into_null_safe, unused_field
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

//import 'package:camera_web/camera_web.dart';
//import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class webviewSaris extends StatefulWidget {
  const webviewSaris({Key? key}) : super(key: key);

  @override
  _webviewSarisState createState() => _webviewSarisState();
}

class _webviewSarisState extends State<webviewSaris> {
  final _flutterwebview = FlutterWebviewPlugin();
  String _loggeruser = '';

  String url = 'https://saris.novanetgroup.com/Account/Login?ReturnUrl=%2F';


  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 88, 76, 132)),
      withZoom: true,
      withLocalStorage: true,
      scrollBar: true,
      withJavascript: true,
      initialChild: Center(child: Text('Cargando...')),
    );
  }

  @override
  void dispose() {
    _flutterwebview.dispose();
    super.dispose();
  }

  
}
