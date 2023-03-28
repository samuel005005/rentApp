import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_house_rd/src/ui/widgets/slidershow/model/slider_model.dart';

class Dot extends StatelessWidget {
  final int index;

  const Dot({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final state = context.read<SliderModel>();
    return _ContainerDoc(
      index: index,
      pageViewIndex: 0,
      primaryColor: state.primaryColor,
      secundaryColor: state.secundaryColor,
      primaryBullet: state.primaryBullet,
      secundaryBullet: state.secundaryBullet,
    );
  }
}

class _ContainerDoc extends StatelessWidget {
  final int index;
  final double pageViewIndex;
  final Color primaryColor;
  final Color secundaryColor;
  final double primaryBullet;
  final double secundaryBullet;
  const _ContainerDoc({
    required this.index,
    required this.pageViewIndex,
    required this.primaryColor,
    required this.secundaryColor,
    required this.primaryBullet,
    required this.secundaryBullet,
  });

  @override
  Widget build(BuildContext context) {
    double size = secundaryBullet;
    Color color = secundaryColor;
    if (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5) {
      size = primaryBullet;
      color = primaryColor;
    }
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: size,
      height: size,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
