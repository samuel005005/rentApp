import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_house_rd/src/features/shared/presentation/provider/theme_provider.dart';

class MyDropdown extends ConsumerStatefulWidget {
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
  MyDropdownState createState() => MyDropdownState();
}

class MyDropdownState extends ConsumerState<MyDropdown> {
  @override
  Widget build(BuildContext context) {
    final isDark = ref.read(themeProvider).isDarkTheme;
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
