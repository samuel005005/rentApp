import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final width = screen.width;
    final height = screen.height;

    return Scaffold(
      body: SafeArea(
        child: Column(),
      ),
    );
  }
}
