//import 'dart:convert';
//import 'dart:io';
import 'dart:ui';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:gobank/profile/infoprofile.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/media.dart';
import '../utils/profiletextfield.dart';
import '../utils/string.dart';
//import 'package:http/http.dart' as http;
//import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late ColorNotifire notifire;

  String fcNombreUsuario = '';
  String fcUsuarioAcceso = '';
  String fcTelefono = '';

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      fcUsuarioAcceso = prefs.getString('fcUsuarioAcceso') ?? '';
      fcNombreUsuario = prefs.getString('fcNombreUsuario') ?? '';
      fcTelefono = prefs.getString('fcTelefono') ?? '';
    });
  }

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

  @override
  void initState() {
    _loadData();
    super.initState();
    getdarkmodepreviousstate();
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: notifire.getprimerycolor,
        iconTheme: IconThemeData(color: notifire.getdarkscolor),
        elevation: 0,
        title: Text(
          CustomStrings.myprofile,
          style: TextStyle(
              color: notifire.getdarkscolor,
              fontSize: height / 40,
              fontFamily: 'Gilroy Bold'),
        ),
        centerTitle: true,
      ),
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: height * 0.8,
              width: width,
              color: Colors.transparent,
              child: Image.asset(
                "images/background.png",
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: height / 60,
                ),
                Stack(
                  children: [
                    Center(
                        child: GestureDetector(
                      onTap: () {
                        imagen(context);
                      },
                      child: Container(
                        height: height / 8,
                        width: width / 4,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset("images/perfil-m.png"),
                      ),
                    )),
                    Column(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: height / 13,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width / 1.8,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    opciones(context);
                                  },
                                  child: Image.asset(
                                    "images/camera.png",
                                    height: height / 25,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: height / 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width / 20,
                    ),
                    Text(
                      CustomStrings.fullnamee,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: height / 50,
                          fontFamily: 'Gilroy Medium'),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 50,
                ),
                Profiletextfilds.textField(
                    notifire.getdarkscolor,
                    notifire.getdarkgreycolor,
                    notifire.getorangeprimerycolor,
                    fcNombreUsuario,
                    notifire.getdarkwhitecolor,
                    false),
                SizedBox(
                  height: height / 50,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width / 20,
                    ),
                    Text(
                      CustomStrings.email,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: height / 50,
                          fontFamily: 'Gilroy Medium'),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 50,
                ),
                Profiletextfilds.textField(
                    notifire.getdarkscolor,
                    notifire.getdarkgreycolor,
                    notifire.getorangeprimerycolor,
                    fcUsuarioAcceso,
                    notifire.getdarkwhitecolor,
                    false),
                SizedBox(
                  height: height / 50,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width / 20,
                    ),
                    Text(
                      fcTelefono,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: height / 50,
                          fontFamily: 'Gilroy Medium'),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 50,
                ),
                Profiletextfilds.textField(
                    notifire.getdarkscolor,
                    notifire.getdarkgreycolor,
                    notifire.getorangeprimerycolor,
                    CustomStrings.phonenumbers,
                    notifire.getdarkwhitecolor,
                    false),
                SizedBox(
                  height: height / 50,
                ),
                SizedBox(
                  height: height / 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyProfile(),
                        ),
                      );
                    },
                    child: Container(
                      height: height / 15,
                      width: width,
                      decoration: BoxDecoration(
                        color: notifire.getorangeprimerycolor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          CustomStrings.savechange,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: height / 50,
                              fontFamily: 'Gilroy Bold'),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void imagen(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(500.0),
            ),
            contentPadding: const EdgeInsets.all(0),
            content: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500.0),
                image: const DecorationImage(
                  image: AssetImage('images/perfil-m.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: (300 - 50) / 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Image.asset(
                        'images/logos.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  opciones(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(0),
            content: SingleChildScrollView(
                child: Column(
              children: [
                InkWell(
                  onTap: () {
                    // selImagen(1, context);
                    CherryToast.info(
                      backgroundColor: notifire.getbackcolor,
                      title: Text('En proceso',
                          style: TextStyle(color: notifire.getdarkscolor),
                          textAlign: TextAlign.start),
                      borderRadius: 5,
                    ).show(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1, color: Colors.grey.shade300))),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text(
                            'Toma una foto',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.deepPurpleAccent,
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // selImagen(2, context);
                    CherryToast.info(
                      backgroundColor: notifire.getbackcolor,
                      title: Text('En proceso',
                          style: TextStyle(color: notifire.getdarkscolor),
                          textAlign: TextAlign.start),
                      borderRadius: 5,
                    ).show(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text(
                            'Elegir de Galeria',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Icon(
                          Icons.photo,
                          color: Colors.deepPurpleAccent,
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
          );
        });
  }

  // Future selImagen(op, context) async {
  //   File Imagen;
  //   final picker = ImagePicker();
  //   var pickedFile;

  //   if (op == 1) {
  //     pickedFile = await picker.pickImage(source: ImageSource.camera);
  //   } else {
  //     pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //   }

  //   if (pickedFile != null) {
  //     Imagen = File(pickedFile.path);
  //     print(Imagen);

  //     subirImagen(context, Imagen);
  //   } else {
  //     CherryToast.error(
  //       title: const Text('No se ha seleccionado ninguna foto',
  //           style: TextStyle(color: Color.fromARGB(255, 226, 226, 226)),
  //           textAlign: TextAlign.justify),
  //       borderRadius: 5,
  //     ).show(context);
  //   }
  //   Navigator.of(context).pop();
  // }

  // Future<void> subirImagen(BuildContext context, File img) async {
  //   var imageUrl = '';
  //   const apiKey = '3b346fac515eaa6d6e2de7f6387c7186';

  //   var request = http.MultipartRequest(
  //       'POST', Uri.parse('https://api.imgbb.com/1/upload'));

  //   request.fields['key'] = apiKey;

  //   request.files.add(await http.MultipartFile.fromPath('image', img.path));

  //   try {
  //     final response = await request.send();

  //     if (response.statusCode == 200) {
  //       final responseString = await response.stream.bytesToString();
  //       final decodedResponse = jsonDecode(responseString);
  //       if (decodedResponse.containsKey('data') &&
  //           decodedResponse['data'].containsKey('url')) {
  //         imageUrl = decodedResponse['data']['url'];

  //         //      CambiarFoto(context, imageUrl);
  //       } else {
  //         print('La respuesta no contiene una URL válida.');
  //       }
  //     } else {
  //       print(
  //           'Error al subir la imagen. Código de respuesta: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error de red al subir la imagen: $e');
  //   }
  // }
}
