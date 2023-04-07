import 'package:flutter/material.dart';

class DetailPost extends StatelessWidget {
  final String description;
  final IconData iconData;

  const DetailPost(
      {super.key, required this.description, required this.iconData});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final width = screen.width;
    // final height = screen.height;
    final sizeTitle = width * 0.035;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: const Color(0xfffdfdfd),
        border: Border.all(
          color: const Color(0xffe9e9e9),
        ),
      ),
      child: Row(
        children: [
          Icon(iconData),
          SizedBox(width: width * 0.013),
          Text(
            description,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: sizeTitle,
            ),
          ),
        ],
      ),
    );
  }
}
