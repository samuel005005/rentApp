import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Rating extends StatefulWidget {
  final int maximumRating;
  final Function(int) onRatingSelected;
  final double size;

  const Rating(
      {super.key,
      required this.onRatingSelected,
      this.maximumRating = 5,
      required this.size});

  @override
  State<Rating> createState() => _Rating();
}

class _Rating extends State<Rating> {
  int _currentRating = 0;

  Widget _buildRatingStar(int index) {
    if (index < _currentRating) {
      return Icon(
        (index != widget.maximumRating - 1
            ? FontAwesomeIcons.solidStar
            : FontAwesomeIcons.starHalfStroke),
        color: Colors.orange,
        size: widget.size,
      );
    } else {
      return Icon(
        FontAwesomeIcons.star,
        size: widget.size,
      );
    }
  }

  Widget _buildBody() {
    final stars = List<Widget>.generate(widget.maximumRating, (index) {
      return GestureDetector(
        child: _buildRatingStar(index),
        onTap: () {
          setState(() {
            _currentRating = index + 1;
          });

          widget.onRatingSelected(_currentRating);
        },
      );
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: stars,
        ),
        // TextButton(
        //   child: const Text("Clear", style: TextStyle(color: Colors.blue)),
        //   onPressed: () {
        //     setState(() {
        //       _currentRating = 0;
        //     });
        //     widget.onRatingSelected(_currentRating);
        //   },
        // )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
}
