import 'package:flutter/material.dart';

class MyProgressScreen extends StatelessWidget {
  const MyProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Progress"),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          "Progress tracking coming soon...",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
