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
    return LayoutBuilder(builder: (context, contraints) {
      final width = contraints.maxWidth;
      final height = contraints.maxHeight;
      final sizeTitle = width * 0.06;

      // print('_width $_width');
      // print('_height $_height');
      return Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Container(
          width: double.infinity,
          height: double.infinity,
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
              Padding(
                padding: const EdgeInsets.all(12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                    width: width,
                    height: height * .55,
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.063,
                      right: width * 0.063,
                      top: height * 0.027),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: sizeTitle,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: height * 0.054,
                        child: Rating(
                          onRatingSelected: (rating) {},
                          maximumRating: 5,
                          size: width * 0.054,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: height * 0.089,
                        child: Text(
                          direction,
                          style: TextStyle(
                            fontSize: height * 0.043,
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
                    padding: const EdgeInsets.all(5),
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
              SizedBox(height: height * 0.027),
            ],
          ),
        ),
      );
    });
  }
}
