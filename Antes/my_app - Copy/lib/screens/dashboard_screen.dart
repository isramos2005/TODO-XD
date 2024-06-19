// ignore_for_file: use_build_context_synchronously, camel_case_types, library_private_types_in_public_api, unused_import, unused_local_variable

import 'package:my_app/screens/crud_Usuarios/listusuario_screen.dart';
import 'package:my_app/utils/ColorPalette.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class dashboard_screen extends StatefulWidget {
  const dashboard_screen({super.key});

  @override
  _dashboard_screenState createState() => _dashboard_screenState();
}

class _dashboard_screenState extends State<dashboard_screen> {
  String nombreUsuario = '';


  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nombreUsuario = prefs.getString('nombreUsuario') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(8.0),
          height: 140,
          width: 430,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: const DecorationImage(
              image: AssetImage("images/Wallpaper_Login.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: Text(
                  _getCurrentTime(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color.fromARGB(172, 255, 255, 255),
                    fontSize: 50.0,
                    fontFamily: 'RobotoMono',
                  ),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => const ListUsuarioScreen()),
                   );
                },
                child: const CardWidget(
                  title: 'Usuarios',
                  backgroundImage: 'images/Formularios.jpg',
                  icon: Icons.supervised_user_circle_outlined,
                ),
              ),  
            ],
          ),
        ),
      ],
    );
  }

   String _getCurrentTime() {
    final DateTime now = DateTime.now();
    final String formattedTime = DateFormat.jm().format(now);
    return formattedTime;
  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final String backgroundImage;
  final IconData icon;

  const CardWidget({super.key, 
    required this.title,
    required this.backgroundImage,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: 335,
      width: 325,
      child: Stack(
        children: [
          Image.asset(
            backgroundImage,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            height: 335,
            width: 325,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 60.0,
                ),
                const SizedBox(height: 20.0),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'RobotoMono',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
