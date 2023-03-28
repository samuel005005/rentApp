import 'package:flutter/material.dart';
import 'package:rest_house_rd/src/ui/widgets/slidershow/dot.dart';

class Dots extends StatelessWidget {
  final int slideCount;

  const Dots({
    super.key,
    required this.slideCount,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          slideCount,
          (idx) => Dot(index: idx),
        ),
      ),
    );
  }
}
