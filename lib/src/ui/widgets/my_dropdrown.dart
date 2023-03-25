import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyDropdown extends StatefulWidget {
  final String text;
  const MyDropdown({super.key, required this.text});

  @override
  State<MyDropdown> createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: <Widget>[
            Text(
              widget.text,
              style: const TextStyle(
                  color: Color(0xff575757),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Alilato Arabic Regular'),
            ),
            const Spacer(),
            const Icon(
              FontAwesomeIcons.chevronDown,
              color: Color(0xffd9d9d9),
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
