import 'package:flutter/material.dart';

class TrialInformation extends StatefulWidget {
  const TrialInformation({super.key});

  @override
  State<TrialInformation> createState() => _TrialInformationState();
}

class _TrialInformationState extends State<TrialInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exam and Trial Information',
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