// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names, library_private_types_in_public_api, avoid_types_as_parameter_names, empty_catches

import 'dart:convert';
import 'package:my_app/models/Usuario.dart';
import 'package:my_app/screens/crud_Usuarios/createusuario.dart';
import 'package:my_app/screens/crud_Usuarios/editusuario.dart';
//import 'package:my_app/screens/Usuario/editUsuario_screen.dart';
import 'package:my_app/toastconfig/toastconfig.dart';
import 'package:my_app/utils/colorPalette.dart';
import 'package:my_app/utils/appbar_roots.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:my_app/screens/Usuario/createperonsa_screen.dart';

class ListUsuarioScreen extends StatefulWidget {
  const ListUsuarioScreen({super.key});

  @override
  _ListUsuarioScreenState createState() => _ListUsuarioScreenState();
}

class _ListUsuarioScreenState extends State<ListUsuarioScreen> {
  List<Usuario> Usuarios = [];
  List<Usuario> filteredUsuarios = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchUsuariosList();
  }

  Future<void> _fetchUsuariosList() async {
    try {
      final response = await http.get(Uri.parse('${apiUrl}Usuarios/Index'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          Usuarios = data.map((item) {
            item['user_FechaCrea'] = DateTime.parse(item['user_FechaCrea']);
            item['user_FechaModifica'] = item['user_FechaModifica'] != null
                ? DateTime.parse(item['user_FechaModifica'])
                : null;

            return Usuario.fromJson(item);
          }).toList();
          filteredUsuarios = List.from(Usuarios);
        });
      } else {}
    } catch (e) {}
  }

  void _filterUsuarios(String query) {
    setState(() {
      filteredUsuarios = Usuarios.where((Usuario) => Usuario.user_NombreUsuario
          .toLowerCase()
          .contains(query.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBackButton(
        title: 'Listado de Usuarios',
        profileImageUrl:
            'https://64.media.tumblr.com/6a5a68b858b592f3bc84d2e7f4be90bb/8a8beb1bdd1ae19a-48/s1280x1920/38303321aed4091d34600f8d9147378d46b29d35.jpg',
        onProfilePressed: () {},
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NewUsuarioForm()),
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: ColorPalette.primaryColor,
              minimumSize: const Size(365.0, 45.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              'Nuevo',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoMono',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: _filterUsuarios,
              decoration: InputDecoration(
                labelText: 'Buscar',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsuarios.length,
              itemBuilder: (context, index) {
                final Usuario = filteredUsuarios[index];

                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(Usuario.user_NombreUsuario),
                    subtitle: Text('Rol: ${Usuario.role_Descripcion ?? 'N/A'}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: IconButton(
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const EditUsuarioForm(),
                                ),
                              );
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                   prefs.setString('Id_Usuario', Usuario.user_Id.toString() );
                              
                            },
                            icon: const Icon(Icons.edit,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: IconButton(
                            onPressed: () => _showDeleteConfirmationDialog(
                                Usuario.user_Id.toString()),
                            icon: const Icon(Icons.delete,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmationDialog(String UsuarioId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Eliminar Usuario'),
          content:
              const Text('¿Estás seguro de que quieres eliminar esta Usuario?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorPalette.primaryColor,
              ),
              onPressed: () {
                _deleteUsuario(int.parse(UsuarioId));
                Navigator.of(context).pop();
              },
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );
  }

  void _deleteUsuario(int UsuarioId) async {
    try {
      UsuarioDelete UsuarioData = UsuarioDelete(
        user_Id: UsuarioId,
      );

      String usuarioJson = jsonEncode(UsuarioData);

      final response = await http.put(
        Uri.parse('${apiUrl}Usuarios/Delete'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
        body: usuarioJson,
      );

      if (response.statusCode == 200) {
        final decodedJson = jsonDecode(response.body);
        final codeStatus = decodedJson["code"];
        final messageStatus = decodedJson["message"];

        if (codeStatus.toString() == '200') {
          CherryToast.success(
            title: Text('$messageStatus',
                style:
                    const TextStyle(color: Color.fromARGB(255, 226, 226, 226)),
                textAlign: TextAlign.start),
            borderRadius: 5,
          ).show(context);

          _fetchUsuariosList();
        } else {
          CherryToast.error(
            title: const Text('Ha ocurrido con un error inesperado',
                style: TextStyle(color: Color.fromARGB(255, 226, 226, 226)),
                textAlign: TextAlign.start),
            borderRadius: 5,
          ).show(context);
        }
      } else {}
    } catch (e) {}
  }
}
