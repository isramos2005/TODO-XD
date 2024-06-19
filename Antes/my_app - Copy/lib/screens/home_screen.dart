// home_screen.dart
// ignore_for_file: library_private_types_in_public_api, sized_box_for_whitespace

import 'package:my_app/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:my_app/utils/appbar_roots.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/navbar_roots.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String nombreUsuario = '';


 @override
  void initState() {
    super.initState();
    _user();
  }

  Widget _getSelectedComponent() {
    switch (_selectedIndex) {
      case 0:
        return const dashboard_screen();
        case 1:
        return const dashboard_screen();
      default:
        return const dashboard_screen();
    }
  } 

Future<void> _user() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nombreUsuario = prefs.getString('nombreEmpleado') ?? '';
    });
  }

  
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBarWithoutBackButton(
        title:   'Bienvenido $nombreUsuario',
        profileImageUrl: 'https://64.media.tumblr.com/6a5a68b858b592f3bc84d2e7f4be90bb/8a8beb1bdd1ae19a-48/s1280x1920/38303321aed4091d34600f8d9147378d46b29d35.jpg',
        onProfilePressed: () {
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          child: _getSelectedComponent(),
        ),
      ),
      bottomNavigationBar: NavBarRoots(
        selectedIndex: _selectedIndex,
        onTabTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
