import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawLocation extends StatelessWidget {
  const DrawLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme.background;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: theme,
        maxRadius: 25,
        child: IconButton(
          icon: const Icon(FontAwesomeIcons.hand, color: Colors.grey),
          onPressed: () {},
        ),
      ),
    );
  }
}
