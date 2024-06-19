import 'package:my_app/utils/colorPalette.dart';
import 'package:flutter/material.dart';

class NavBarRoots extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabTapped;

  const NavBarRoots({super.key, required this.selectedIndex, required this.onTabTapped});

  @override
  State<NavBarRoots> createState() => _NavBarRootsState();
}

class _NavBarRootsState extends State<NavBarRoots> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: ColorPalette.primaryColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: const Color(0x82FFFFFF),
      selectedLabelStyle: const TextStyle(
        fontFamily: 'RobotoMono',
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
      currentIndex: widget.selectedIndex,
      onTap: widget.onTabTapped,
      items: const [
     
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: "Inicio",
        ),
      BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: "Inicio",
        ),
      ],
    );
  }
}
