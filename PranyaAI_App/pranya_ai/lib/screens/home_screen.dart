// home_screen.dart
import 'package:flutter/material.dart';
import 'package:pranya_ai/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  final bool userMode;

  HomeScreen({required this.userMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text(userMode ? 'User Home Screen' : 'Admin Home Screen'),
      ),
    );
  }
}
