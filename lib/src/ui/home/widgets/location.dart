import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Location extends StatelessWidget {
  final String locationText;
  final double iconSize;
  const Location(
      {super.key, required this.locationText, required this.iconSize});
  final double _sizeText = 0.78125;
  final double _space = 0.5625;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            children: [
              Icon(
                Ionicons.location_sharp,
                size: iconSize,
                color: const Color(0xfffd6d7a),
              ),
              SizedBox(width: iconSize * _space),
              Text(
                locationText,
                style: TextStyle(
                    color: Colors.black.withOpacity(.7),
                    fontSize: iconSize * _sizeText,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }
}
