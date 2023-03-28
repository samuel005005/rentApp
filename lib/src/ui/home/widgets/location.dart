import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Location extends StatelessWidget {
  final String locationText;
  const Location({super.key, required this.locationText});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                const Icon(
                  Ionicons.location_sharp,
                  size: 35,
                  color: Color(0xfffd6d7a),
                ),
                const SizedBox(width: 18),
                Text(
                  locationText,
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
