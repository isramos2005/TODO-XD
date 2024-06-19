// ignore_for_file: unused_import

import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/screens/login_screen.dart';
import 'package:my_app/utils/ColorPalette.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

class AppBarWithBackButton extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final String profileImageUrl;
  final VoidCallback onProfilePressed;

  const AppBarWithBackButton({
    Key? key,
    required this.title,
    required this.profileImageUrl,
    required this.onProfilePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoMono',
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        },
      ),
      actions: [
        PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'cerrar_sesion') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const loginScreen(),
                ),
              );
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem<String>(
              value: 'cerrar_sesion',
              child: Row(
                children: const [
                  Icon(Icons.logout, color: Colors.black),
                  SizedBox(width: 8),
                  Text('Cerrar Sesión'),
                ],
              ),
            ),
          ],
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(profileImageUrl),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ],
      backgroundColor: ColorPalette.primaryColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarWithoutBackButton extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final String profileImageUrl;
  final VoidCallback onProfilePressed;

  const AppBarWithoutBackButton({
    Key? key,
    required this.title,
    required this.profileImageUrl,
    required this.onProfilePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoMono',
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      actions: [
        PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'cerrar_sesion') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const loginScreen(),
                ),
              );
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem<String>(
              value: 'cerrar_sesion',
              child: Row(
                children: const [
                  Icon(Icons.logout, color: Colors.black),
                  SizedBox(width: 8),
                  Text('Cerrar Sesión'),
                ],
              ),
            ),
          ],
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(profileImageUrl),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ],
      backgroundColor: ColorPalette.primaryColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
