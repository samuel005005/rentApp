import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Rating extends StatefulWidget {
  final int maximumRating;
  final Function(int) onRatingSelected;

  const Rating(
      {super.key, required this.onRatingSelected, this.maximumRating = 5});

  @override
  State<Rating> createState() => _Rating();
}

class _Rating extends State<Rating> {
  int _currentRating = 0;

  Widget _buildRatingStar(int index) {
    if (index < _currentRating) {
      return const Icon(Ionicons.star, color: Colors.orange);
    } else {
      return const Icon(Ionicons.star_outline);
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
