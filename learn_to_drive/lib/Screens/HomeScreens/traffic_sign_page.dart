import 'package:first_app/traffic_sign_controller.dart';
import 'package:flutter/material.dart';

class TrafficSignsPage extends StatefulWidget {
  const TrafficSignsPage({super.key});

  @override
  State<TrafficSignsPage> createState() => _TrafficSignsPageState();
}

class _TrafficSignsPageState extends State<TrafficSignsPage> {
  TrafficSign trafficSignController = TrafficSign();
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
      body: FutureBuilder<List>(
        future: trafficSignController.getAllTrafficSign(),
        builder: (context, snapshot) {
          // print(snapshot.data);
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
                itemBuilder: (context, i) {
                return Card(
                  child: ListTile(
                    title: Text(
                        snapshot.data![i]['TrafficSign'],
                      style: const TextStyle(fontSize: 30.0),
                    ),
                    subtitle: Text(
                        snapshot.data![i]['Image'],
                      style: const TextStyle(fontSize: 20.0),
                      ),
                  ),
                );
              },              
            );
          } else {
            return const Center(
              child: Text('No Data Found'),
            );
          }
        },
      )
    );
  }
}