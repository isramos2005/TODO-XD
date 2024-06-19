// ignore_for_file: use_build_context_synchronously, camel_case_types, sized_box_for_whitespace, non_constant_identifier_names, file_names

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gobank/home/home.dart';
import 'package:gobank/toastconfig/toastconfig.dart';
import 'package:http/http.dart' as http;
import 'package:gobank/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> fetchLogin(
  BuildContext context,
  String fcUsuarioAcceso,
  String fcPassword,
  backgroundColor,
  color,
) async {
  try {
    final prefs = await SharedPreferences.getInstance();

    final response = await http.get(Uri.parse(
        '${apiUrl}Login/LoginApp?fcUsuarioAcceso=$fcUsuarioAcceso&fcPassword=$fcPassword'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data[0].isNotEmpty || data[1].isNotEmpty || data[2].isNotEmpty || data[3].isNotEmpty) {
      prefs.setString("fcUsuarioAcceso",  data[0][0]["fcUsuarioAcceso"].toString());
      prefs.setString("fcNombreUsuario",  data[0][0]["fcNombreUsuario"].toString());
      prefs.setString("fcTelefono",       data[0][0]["fcTelefono"].toString());
      prefs.setString("fiIDCliente",      data[0][0]["fiIDCliente"].toString()); 

       prefs.setString("datalogin[0]", jsonEncode(data[0]));
       prefs.setString("datalogin[1]", jsonEncode(data[1]));
       prefs.setString("datalogin[2]", jsonEncode(data[2]));
       prefs.setString("datalogin[3]", jsonEncode(data[3]));

       Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
      );
      }
      else {
      CherryToast.warning(
            backgroundColor: backgroundColor,
            title: Text(
              'Usuario o Contraseña Incorrectos',
              style: TextStyle(color: color),
              textAlign: TextAlign.start,
            ),
            borderRadius: 5,
          ).show(context);
      }

    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  } finally {}
}

Future<void> fetchDatosRegistro(
    BuildContext context, int pilDUsuario, int pilDSolicitud) async {
  try {
    final prefs = await SharedPreferences.getInstance();

    final response = await http.get(Uri.parse(
        '${apiUrl}Prueba/ListPrueba?pilDUsuario=34&pilDSolicitud=$pilDSolicitud'));

    if (kDebugMode) {
      print(response);
    }

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data[0].toString().isNotEmpty) {
        prefs.setString("data[0]", jsonEncode(data[0]));
      }

      if (data[1].toString().isNotEmpty) {
        prefs.setString("data[1]", jsonEncode(data[1]));
      }

      if (data[2].toString().isNotEmpty) {
        prefs.setString("data[2]", jsonEncode(data[2]));
      }

      if (data[3].toString().isNotEmpty) {
        prefs.setString("data[3]", jsonEncode(data[3]));
      }
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  } finally {}
}

Future<void> IdentidadRegistro(
    BuildContext context, TextEditingController pcIdentidadCliente) async {
  try {
    var newpcIdentidadCliente = pcIdentidadCliente.text.replaceAll("-", "");
    final prefs = await SharedPreferences.getInstance();

    final response = await http.get(Uri.parse(
        '${apiUrl}Login/IdentidadRegistro?pcIdentidadCliente=$newpcIdentidadCliente'));

    if (kDebugMode) {
      print(response);
    }
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      prefs.setString("fcCorreo", data[0]?["fcCorreo"]);
      prefs.setString("fcNombre", data[0]?["fcNombre"]);

      fetchDatosRegistro(context, 34, data[0]?["fiIDSolicitud"]);
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  } finally {}
}
