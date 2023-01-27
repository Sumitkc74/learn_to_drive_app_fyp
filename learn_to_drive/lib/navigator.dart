import 'package:first_app/Screens/settings.dart';
import 'package:first_app/Screens/tutorials.dart';
import 'package:flutter/material.dart';

import 'Screens/home_page.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Tutorials'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),      
      ]),
    );
  }
}
