// ignore_for_file: use_key_in_widget_constructors, import_of_legacy_library_into_null_safe, camel_case_types, library_private_types_in_public_api, unused_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:signalr_client/signalr_client.dart';
import 'package:http/http.dart' as http;
import '../api.dart';

class Notification_pushConfig extends StatefulWidget {
  const Notification_pushConfig({super.key});

  @override
  _Notification_pushConfigState createState() =>
      _Notification_pushConfigState();
}

class _Notification_pushConfigState extends State<Notification_pushConfig> {
  final hubConnection = HubConnectionBuilder()
      .withUrl('https://api.novanetgroup.com/notificaciones')
      .build();

  TextEditingController messageController = TextEditingController();
  List<String> messages = [];

  @override
  void initState() {
    super.initState();

    // Conectar a SignalR Hub
    _startHubConnection();

    // Recibimiento de Notificacions Api
    hubConnection.on('SendNotificacion', _handleReceivedMessage);
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

  void _handleReceivedMessage(List<Object?> arguments) {
    var listArguments = [];
    var users = [];
    String? message;

    if (arguments.isNotEmpty) {
      arguments.forEach((arguments) {
        listArguments.add(arguments);

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

    setState(() {
      messages.add('$message');
    });
    
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
      'Very important notification!!',
      description: 'the first notification',
      importance: Importance.max,
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

  Future<void> _sendMessage() async {
    String user = 'IsHatake'; // Replace with the user's name or identifier
    String message = messageController.text;

    // Envio de Mensajes Api
    hubConnection.invoke('Get', args: [user, message]);
    await http.get(Uri.parse(
        'https://api.novanetgroup.com/api/Novanet/SignalR/Get?message=$message'));

    // Clear the text input field
    messageController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Chat with SignalR'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(messages[index]),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your message',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Ensure that the SignalR connection is closed when the app is disposed
    hubConnection.stop();
    super.dispose();
  }
}
