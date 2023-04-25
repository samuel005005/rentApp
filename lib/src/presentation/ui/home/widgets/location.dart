import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:rest_house_rd/src/presentation/theme/colors.dart';
import 'package:rest_house_rd/src/presentation/ui/theme/theme_changer.dart';

class Location extends StatelessWidget {
  final String locationText;
  final double iconSize;
  const Location(
      {super.key, required this.locationText, required this.iconSize});
  final double _sizeText = 0.78125;
  final double _space = 0.5625;
  @override
  Widget build(BuildContext context) {
    final isDark = context.read<ThemeChanger>().isDarkTheme;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            children: [
              Icon(
                Ionicons.location_sharp,
                size: iconSize,
                color: ColorsApp.primaryColor,
              ),
              SizedBox(width: iconSize * _space),
              Text(
                locationText,
                style: TextStyle(
                    color:
                        (isDark) ? Colors.white : Colors.black.withOpacity(.7),
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
