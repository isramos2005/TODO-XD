// ignore_for_file: use_build_context_synchronously, camel_case_types, sized_box_for_whitespace, non_constant_identifier_names

import 'dart:convert';
import 'package:my_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/api.dart';
import 'package:my_app/toastconfig/toastconfig.dart';

Future<void> fetchData(
    BuildContext context, String username, String password) async {
  try {

    final response = await http.get(Uri.parse(
        '${apiUrl}Usuarios/Login?username=$username&password=$password'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final message = data["user_NombreUsuario"];

      if (message == 'Usuario o Contraseña Incorrectos') {
        CherryToast.warning(
          title: const Text('Usuario o Contraseña Incorrectos',
              style: TextStyle(color: Color.fromARGB(255, 226, 226, 226)),
              textAlign: TextAlign.start),
          borderRadius: 5,
        ).show(context);
      } else if (message == 'Usuario No Valido') {
        CherryToast.warning(
          title: const Text('Usuario No Valido',
              style: TextStyle(color: Color.fromARGB(255, 226, 226, 226)),
              textAlign: TextAlign.start),
          borderRadius: 5,
        ).show(context);
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setInt('user_Id', data['user_Id']);
        prefs.setString('user_NombreUsuario', data['user_NombreUsuario']);
        prefs.setString('nombreEmpleado', data['nombreEmpleado']);
        prefs.setString('role_Descripcion', data['role_Descripcion']);

        bool adminValue = data['user_Admin'];
        int adminIntValue = adminValue ? 1 : 0;
        prefs.setInt('user_Admin', adminIntValue);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
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
