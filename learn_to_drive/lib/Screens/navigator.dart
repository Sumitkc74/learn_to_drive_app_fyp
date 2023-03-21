import 'package:first_app/Screens/SettingsScreens/settings.dart';
import 'package:first_app/Screens/tutorials.dart';
import 'package:flutter/material.dart';

import 'package:first_app/Screens/HomeScreens/home_page.dart';
import 'package:get/get.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<NavigationPage> {

  int _selectedIndex = 0;  
  final List<Widget> _children =[
    const HomeScreen(),
    const TutorialsScreen(),
    const SettingsScreen(),
  ];  
  
  void _onItemTapped(int index) {  
    setState(() {  
      _selectedIndex = index;  
    });  
  }  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFFFDE17),
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: const Icon(Icons.home), label: 'Home'.tr),
          BottomNavigationBarItem(icon: const Icon(Icons.tv), label: 'Tutorials'.tr),
          BottomNavigationBarItem(icon: const Icon(Icons.settings), label: 'Settings'.tr),      
        ]
      ),
    );
  }
}
