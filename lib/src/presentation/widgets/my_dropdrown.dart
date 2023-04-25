import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rest_house_rd/src/presentation/theme/theme_changer.dart';

class MyDropdown extends StatefulWidget {
  final String text;
  final double fontSize;
  final double width;
  final double iconSize;
  const MyDropdown(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.width,
      required this.iconSize});

  @override
  State<MyDropdown> createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  @override
  Widget build(BuildContext context) {
    final isDark = context.read<ThemeChanger>().isDarkTheme;
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: <Widget>[
            Text(
              widget.text,
              style: TextStyle(
                  color: (isDark) ? Colors.white : const Color(0xff575757),
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Alilato Arabic Regular'),
            ),
            const Spacer(),
            Icon(
              FontAwesomeIcons.chevronDown,
              size: widget.iconSize,
            ),
          ],
        ),
      ),
    );
  }
}