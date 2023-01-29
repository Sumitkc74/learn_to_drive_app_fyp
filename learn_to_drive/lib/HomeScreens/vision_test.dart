import 'package:flutter/material.dart';

class VisionTest extends StatefulWidget {
  const VisionTest({super.key});

  @override
  State<VisionTest> createState() => _VisionTestState();
}

class _VisionTestState extends State<VisionTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Traffic Signs',
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