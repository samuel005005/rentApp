import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_house_rd/src/ui/widgets/slidershow/model/slider_model.dart';
import 'package:rest_house_rd/src/ui/widgets/slidershow/sliders.dart';

class SlideShow extends StatelessWidget {
  final List<Widget> slides;
  final bool indicationUpPosition;
  final Color primaryColor;
  final Color secundaryColor;
  final double primaryBullet;
  final double secundaryBullet;

  const SlideShow({
    super.key,
    this.slides = const <Widget>[],
    this.indicationUpPosition = false,
    this.primaryColor = Colors.blue,
    this.secundaryColor = Colors.grey,
    this.primaryBullet = 20,
    this.secundaryBullet = 12,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SliderModel(
          primaryColor, secundaryColor, primaryBullet, secundaryBullet),
      child: SafeArea(
        child: Center(
          child: _CreateStructSlideShow(
              indicationUpPosition: indicationUpPosition, slides: slides),
        ),
      ),
    );
  }
}

class _CreateStructSlideShow extends StatelessWidget {
  const _CreateStructSlideShow({
    required this.indicationUpPosition,
    required this.slides,
  });

  final bool indicationUpPosition;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // if (indicationUpPosition) Dots(slideCount: slides.length),
        Expanded(
          child: Slides(slides: slides),
        ),
        //   if (!indicationUpPosition) Dots(slideCount: slides.length),
      ],
    );
  }
}
