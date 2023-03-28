import 'package:flutter/material.dart';

class DetailPost extends StatelessWidget {
  final String description;
  final IconData iconData;
  const DetailPost(
      {super.key, required this.description, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xfffdfdfd),
          border: Border.all(color: const Color(0xffe9e9e9))),
      child: Row(
        children: [
          Icon(
            iconData,
            color: const Color(0xffff717f),
          ),
          const SizedBox(width: 10),
          Text(
            description,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
