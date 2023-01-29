import 'package:flutter/material.dart';

class ReadingMaterials extends StatefulWidget {
  const ReadingMaterials({super.key});

  @override
  State<ReadingMaterials> createState() => _ReadingMaterialsState();
}

class _ReadingMaterialsState extends State<ReadingMaterials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reading Materials',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black, 
          ),
        ),
        toolbarHeight: 80,
        foregroundColor: const Color(0xff00183F),
        backgroundColor: const Color(0xFFFFDE17),
        shadowColor: const Color(0xff00183F),
      ),
      
      backgroundColor: const Color(0xFF303030),
      body: Stack(
        
      ),
    );
  }
}