import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rest_house_rd/src/ui/widgets/rating.dart';

class Post extends StatelessWidget {
  final String image;
  final String title;
  final String direction;
  final List<Widget> details;

  const Post(
      {super.key,
      required this.image,
      required this.title,
      required this.direction,
      required this.details});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: screen.width * .7,
        height: screen.height * .5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 30,
              spreadRadius: -40,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            const SizedBox(width: 350),
            Padding(
              padding: const EdgeInsets.all(12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  width: 300,
                  height: 250,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 20,
                      child: Rating(
                        onRatingSelected: (rating) {},
                        maximumRating: 5,
                        size: 17,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 33,
                      child: Text(
                        direction,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: details,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffff717f),
                      border: Border.all(color: const Color(0xffe9e9e9))),
                  child: const Icon(
                    Ionicons.chevron_forward,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
