import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../widgets/rating.dart';

class DetailPostScreen extends StatelessWidget {
  const DetailPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final maxHeight = screen.height * .45;
    final minHeight = screen.height * .44;
    final width = screen.width;
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            delegate: _SliverCustomHeaderDelegate(
              maxHeight: maxHeight,
              minHeight: minHeight,
              child: SizedBox(
                width: width,
                child: Stack(
                  children: [
                    SizedBox(width: width),
                    Image(
                      width: width,
                      fit: BoxFit.fitWidth,
                      image: const AssetImage('assets/1.jpg'),
                    ),
                    Positioned(
                      left: 20,
                      top: 50,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent.withOpacity(0.4),
                        ),
                        child: const Icon(
                          Icons.chevron_left,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: const EdgeInsets.all(25),
                  height: 500,
                  child: Stack(
                    children: [
                      const Text(
                        "Masara House",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 20,
                        child: Rating(
                          onRatingSelected: (rating) {},
                          maximumRating: 5,
                          size: 16,
                        ),
                      ),
                      Positioned(
                        top: 40,
                        child: Row(
                          children: [
                            const Icon(
                              Ionicons.location_sharp,
                              size: 18,
                              color: Color(0xfffd6d7a),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Mojolaban, Solo",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate(
      {required this.minHeight, required this.maxHeight, required this.child})
      : assert(maxHeight > minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;
  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
