// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, file_names, unused_local_variable, camel_case_types, import_of_legacy_library_into_null_safe, unused_field

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signalr_client/hub_connection_builder.dart';
//import 'package:camera_web/camera_web.dart';
//import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Webview_screen extends StatefulWidget {
  final String codificado;

  const Webview_screen({Key? key, required this.codificado}) : super(key: key);

  @override
  _Webview_screenState createState() => _Webview_screenState();
}

class _Webview_screenState extends State<Webview_screen> {
  final _flutterwebview = FlutterWebviewPlugin();
  String _loggeruser = '';

  String url = 'https://orion.novanetgroup.com/Account/extLogin?id=';

  final hubConnection = HubConnectionBuilder()
      .withUrl('https://api.novanetgroup.com/notificaciones')
      .build();

  //List<String> messages = [];

  @override
  void initState() {
    super.initState();
    //Crear Url de WebView
    _url();
    //Usuario Logueado
    _setUsuario();
    // Conectar a SignalR Hub
    _startHubConnection();
    // Recibimiento de Notificacions Api
    hubConnection.on('SendNotificacion', _handleReceivedMessage);
  }

  Future<void> _url() async {
    url += widget.codificado;
  }

  Future<void> _setUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _loggeruser = prefs.getString('fcNombreCorto')!;
    });
  }

  void _startHubConnection() async {
    try {
      await hubConnection.start();
      if (kDebugMode) {
        print('SignalR conexion iniciada.');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error de conexión a SignalR: $e');
      }
    }
  }

  void _handleReceivedMessage(List<dynamic> arguments) {
    List<dynamic> listArguments = [];
    List<dynamic> users = [];
    String? message;

    if (arguments.isNotEmpty) {
      arguments.forEach((argument) {
        listArguments.add(argument);

        if (listArguments.isNotEmpty) {
          listArguments[0][0].forEach((element) {
            users.add(element);
          });
        }
      });
      message = listArguments[0][1];
    }

    print("usuarios: $users");
    print("mensaje: $message");

    showNotification(message);
  }

  showNotification(message) async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    AndroidNotificationChannel channel = const AndroidNotificationChannel(
      'high channel',
      'Notificacion Importante',
      description: 'Notificación de Novanet',
      importance: Importance.high,
    );

    await flutterLocalNotificationsPlugin.show(
      1,
      'Notificación',
      '$message',
      NotificationDetails(
        android: AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: channel.description),
      ),
    );
  }

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

  void main() {
    runApp(
      MaterialApp(
        home: Webview_screen(
          codificado: '',
        ),
      ),
    );
  }
}
