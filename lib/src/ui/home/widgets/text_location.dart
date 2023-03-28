import 'package:flutter/material.dart';
import 'package:rest_house_rd/src/ui/widgets/my_dropdrown.dart';

class TextLocation extends StatelessWidget {
  final String textLocation;
  const TextLocation({super.key, required this.textLocation});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: MyDropdown(text: textLocation),
          ),
        ],
      ),
    );
  }
}
