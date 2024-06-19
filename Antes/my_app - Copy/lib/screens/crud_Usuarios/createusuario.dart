// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names, unused_field, sized_box_for_whitespace, use_build_context_synchronously, empty_catches

import 'package:cherry_toast/cherry_toast.dart';
import 'package:my_app/models/Empleado.dart';
import 'package:my_app/models/Roles.dart';
import 'package:my_app/models/Usuario.dart';
import 'package:my_app/screens/crud_Usuarios/listusuario_screen.dart';
import 'package:my_app/utils/colorPalette.dart';
import 'package:my_app/utils/appbar_roots.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/api.dart';

class NewUsuarioForm extends StatefulWidget {
  const NewUsuarioForm({super.key});

  @override
  _NewUsuarioFormState createState() => _NewUsuarioFormState();
}

class _NewUsuarioFormState extends State<NewUsuarioForm> {
  List<Empleado> empleados = [];
  List<Roles> roles = [];

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernombreusuarioController =
      TextEditingController();
  final TextEditingController _user_ContrasenaController =
      TextEditingController();
  bool _user_AdminController = false;
  Empleado? _empl_IdController;
  Roles? _role_IdController;

  @override
  void initState() {
    super.initState();
    _fetchEmpleadoList();
    _fetchRolesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBackButton(
        title: 'Registro de Usuario',
        profileImageUrl:
            'https://64.media.tumblr.com/6a5a68b858b592f3bc84d2e7f4be90bb/8a8beb1bdd1ae19a-48/s1280x1920/38303321aed4091d34600f8d9147378d46b29d35.jpg',
        onProfilePressed: () {},
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      width: 170.0,
                      height: 170.0,
                      child: Image.asset(
                        'images/AgregarUsuario.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _usernombreusuarioController,
                  decoration:
                      const InputDecoration(labelText: 'Nombre de Usuario'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nombre de Usuario es un campo requerido';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _user_ContrasenaController,
                  decoration: const InputDecoration(labelText: 'Contraseña'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Contraseña es un campo requerido';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<bool>(
                  value: _user_AdminController,
                  items: const [
                    DropdownMenuItem<bool>(
                      value: true,
                      child: Text('Sí'),
                    ),
                    DropdownMenuItem<bool>(
                      value: false,
                      child: Text('No'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _user_AdminController = value!;
                    });
                  },
                ),
                DropdownButtonFormField<Empleado>(
                  value: _empl_IdController,
                  items: [
                    const DropdownMenuItem<Empleado>(
                      value: null,
                      child: Text('Seleccione'),
                    ),
                    ...empleados.map((empleado) {
                      return DropdownMenuItem<Empleado>(
                        value: empleado,
                        child: Text(
                            '${empleado.empl_Nombres} ${empleado.empl_Apellidos}'),
                      );
                    }).toList(),
                  ],
                  onChanged: (Empleado? value) {
                    setState(() {
                      _empl_IdController = value;
                    });
                  },
                  decoration: const InputDecoration(labelText: 'Empleado'),
                  validator: (value) {
                    if (value == null) {
                      return 'Empleado es un campo requerido';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<Roles>(
                  value: _role_IdController,
                  items: [
                    const DropdownMenuItem<Roles>(
                      value: null,
                      child: Text('Seleccione'),
                    ),
                    ...roles.map((rol) {
                      return DropdownMenuItem<Roles>(
                        value: rol,
                        child: Text(rol.role_Descripcion),
                      );
                    }).toList(),
                  ],
                  onChanged: (Roles? value) {
                    setState(() {
                      _role_IdController = value;
                    });
                  },
                  decoration: const InputDecoration(labelText: 'Rol'),
                  validator: (value) {
                    if (value == null) {
                      return 'Rol es un campo requerido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _NuevoUsuario();
                    }
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
                    'Guardar',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoMono',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _NuevoUsuario() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? user_Crea = prefs.getInt('user_Id');

      UsuarioCreate UsuarioData = UsuarioCreate(
          user_NombreUsuario: _usernombreusuarioController.text,
          user_Contrasena: _user_ContrasenaController.text,
          user_Admin: _user_AdminController,
          empl_Id: _empl_IdController?.empl_Id,
          role_Id: _role_IdController?.role_Id,
          user_UserCrea: user_Crea);

      String usuarioJson = jsonEncode(UsuarioData);
      final response = await http.post(
        Uri.parse('${apiUrl}Usuarios/Insert'),
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

          Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ListUsuarioScreen(),
          ),
        );
        } else if (codeStatus.toString() == '409') {
          CherryToast.error(
            title: const Text('Ha ocurrido con un error inesperado',
                style: TextStyle(color: Color.fromARGB(255, 226, 226, 226)),
                textAlign: TextAlign.start),
            borderRadius: 5,
          ).show(context);
        } else {}
      } else {}
    } catch (e) {}
  }

  void _fetchEmpleadoList() async {
    try {
      final response = await http.get(Uri.parse('${apiUrl}Empleados/Index'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          empleados = data.map((item) {
            return Empleado.fromJson(item as Map<String, dynamic>);
          }).toList();
        });
      } else {}
    } catch (e) {}
  }

  void _fetchRolesList() async {
    try {
      final response = await http.get(Uri.parse('${apiUrl}Roles/Index'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        setState(() {
          roles = data.map((item) {
            return Roles.fromJson(item as Map<String, dynamic>);
          }).toList();
        });
      } else {}
    } catch (e) {}
  }
}
