import 'package:flutter/material.dart';

class TrafficSignsPage extends StatefulWidget {
  const TrafficSignsPage({super.key});

  @override
  State<TrafficSignsPage> createState() => _TrafficSignsPageState();
}

class _TrafficSignsPageState extends State<TrafficSignsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Traffic Signs')),
    );
  }
}