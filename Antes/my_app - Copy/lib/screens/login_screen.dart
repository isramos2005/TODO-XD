// ignore_for_file: use_build_context_synchronously, camel_case_types, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/service/login_service.dart';
import 'package:my_app/utils/ColorPalette.dart';
import 'package:my_app/toastconfig/toastconfig.dart';

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
                    image: AssetImage("images/Wallpaper_Login.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Card(
                        color: const Color.fromARGB(82, 0, 0, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 25.0),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                height: double.parse(
                                    (MediaQuery.of(context).size.height * 0.4)
                                        .toStringAsFixed(2)),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Image.asset(
                                    "images/Logo.png",
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
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  label: Text("Usuario",
                                      style: TextStyle(color: Colors.white)),
                                  prefixIcon:
                                      Icon(Icons.person, color: Colors.white),
                                ),
                                style: const TextStyle(color: Colors.white),
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
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  label: const Text("Contraseña",
                                      style: TextStyle(color: Colors.white)),
                                  prefixIcon: const Icon(Icons.key,
                                      color: Colors.white),
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
                                            color: Colors.white)
                                        : const Icon(CupertinoIcons.eye_fill,
                                            color: Colors.white),
                                  ),
                                ),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            const SizedBox(height: 18.00),
                            Padding(
                              padding: const EdgeInsets.all(15),
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
                                      vertical: 10, horizontal: 20),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: ColorPalette.primaryColor,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 4,
                                        spreadRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Iniciar sesión",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'RobotoMono',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 70),
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
