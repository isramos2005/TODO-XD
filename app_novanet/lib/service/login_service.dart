// ignore_for_file: use_build_context_synchronously, camel_case_types, sized_box_for_whitespace, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:app_novanet/api.dart';
import 'package:app_novanet/toastconfig/toastconfig.dart';
import 'package:app_novanet/screens/Webview_screen.dart';


Future<void> fetchData(
    BuildContext context, String username, String password) async {
  try {

    String usuario = '';
    final response = await http.get(Uri.parse(
        '${apiUrl}Login/Login?Email=$username&Password=$password'));

    if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
     final message = data["Mensaje"];

      if (message.toString().contains('Usuario Invalido')) {
        CherryToast.warning(
          title: const Text('Usuario Invalido',
              style: TextStyle(color: Color.fromARGB(255, 226, 226, 226)),
              textAlign: TextAlign.start),
          borderRadius: 5,
        ).show(context);
      } else if (message == 'Error al Iniciar sesion. verificar correo y contraseña.') {
        CherryToast.warning(
          title: const Text('Error al Iniciar sesion. verificar correo y contraseña.',
              style: TextStyle(color: Color.fromARGB(255, 226, 226, 226)),
              textAlign: TextAlign.start),
          borderRadius: 5,
        ).show(context);
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setInt('fiIDUsuario', data['fiIDUsuario']);
        prefs.setString('fcNombreCorto', data['fcNombreCorto']);
        prefs.setString('fcBuzonDeCorreo', data['fcBuzonDeCorreo']);
        prefs.setString('fcEmpresa', data['fcEmpresa']);
        prefs.setString('Role', data['Role']);
        
        usuario = data['UsuarioCifrado'];

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  Webview_screen(codificado: usuario),
          ),
        );
      }
    }
  } catch (e) {
    if (e.toString().contains('Failed host lookup')) {
      CherryToast.warning(
        title: const Text('No se pudo conectar al servidor',
            style: TextStyle(color: Color.fromARGB(255, 226, 226, 226)),
            textAlign: TextAlign.justify),
        borderRadius: 5,
      ).show(context);
    } else {}
  } finally {}
}
