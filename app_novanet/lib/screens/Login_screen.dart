// ignore_for_file: use_build_context_synchronously, camel_case_types, sized_box_for_whitespace, file_names, unused_local_variable, import_of_legacy_library_into_null_safe

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_novanet/service/login_service.dart';
import 'package:app_novanet/toastconfig/toastconfig.dart';
import 'package:permission_handler/permission_handler.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  bool passToggle = true;
  String username = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  Future<void> requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.notification,
      Permission.camera,
    ].request();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment(1, 1),
                    image: AssetImage("images/fondo.png"),
                    fit: (BoxFit.scaleDown),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                        height: double.parse(
                            (MediaQuery.of(context).size.height * 0.1)
                                .toStringAsFixed(2))),
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Card(
                        shadowColor: Colors.black,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5)),
                              child: Container(
                                color: const Color.fromARGB(255, 83, 80, 134),
                                height: double.parse(
                                    (MediaQuery.of(context).size.height * 0.1)
                                        .toStringAsFixed(2)),
                                width: double.parse(
                                    (MediaQuery.of(context).size.width * 1)
                                        .toStringAsFixed(2)),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Image.asset(
                                    "images/LogoCabeceraOrion.png",
                                    height: 230,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 18, left: 18, bottom: 18),
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    username = value;
                                  });
                                },
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  label: Text("User",
                                      style: TextStyle(color: Colors.grey)),
                                  prefixIcon:
                                      Icon(Icons.person, color: Colors.grey),
                                ),
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18),
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    password = value;
                                  });
                                },
                                obscureText: passToggle ? true : false,
                                decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  label: const Text("Password",
                                      style: TextStyle(color: Colors.grey)),
                                  prefixIcon:
                                      const Icon(Icons.key, color: Colors.grey),
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      if (passToggle == true) {
                                        passToggle = false;
                                      } else {
                                        passToggle = true;
                                      }
                                      setState(() {});
                                    },
                                    child: passToggle
                                        ? const Icon(
                                            CupertinoIcons.eye_slash_fill,
                                            color: Colors.grey)
                                        : const Icon(CupertinoIcons.eye_fill,
                                            color: Colors.grey),
                                  ),
                                ),
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ),
                            const SizedBox(height: 4.00),
                            Padding(
                              padding: const EdgeInsets.all(22),
                              child: InkWell(
                                onTap: () {
                                  if (username.isNotEmpty &&
                                      password.isNotEmpty) {
                                    fetchData(context, username, password);
                                  } else {
                                    CherryToast.warning(
                                      title: const Text(
                                          'Llene los campos correctamente',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 226, 226, 226)),
                                          textAlign: TextAlign.justify),
                                      borderRadius: 5,
                                    ).show(context);
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 242, 242, 242),
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 1,
                                        spreadRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Iniciar Sesión",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'RobotoMono',
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 90),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
