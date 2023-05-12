import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class LocationButton extends StatelessWidget {
  const LocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme.background;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: theme,
        maxRadius: 25,
        child: IconButton(
          icon: const Icon(Ionicons.location_outline, color: Colors.grey),
          onPressed: () {},
        ),
      ),
    );
  }
}
