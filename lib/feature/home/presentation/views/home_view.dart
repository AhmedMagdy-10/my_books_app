import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Home View',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
