import 'package:flutter/material.dart';

class Slide extends StatelessWidget {
  final Widget slide;
  const Slide({super.key, required this.slide});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Container(
      width: screen.width * .4,
      height: screen.height * .4,
      padding: const EdgeInsets.all(10),
      child: slide,
    );
  }
}
