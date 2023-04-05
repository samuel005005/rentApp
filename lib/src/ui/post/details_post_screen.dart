import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rest_house_rd/src/ui/routes/app_routes.dart';

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
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.postView);
                      },
                      child: Image(
                        width: width,
                        fit: BoxFit.fitWidth,
                        image: const AssetImage('assets/1.jpg'),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 50,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
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
                  height: 120,
                  child: Stack(
                    children: [
                      const Text(
                        "Masara House",
                        style: TextStyle(
                          fontSize: 20,
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
                              size: 16,
                              color: Color(0xfffd6d7a),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Mojolaban, Solo",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey.withOpacity(0.9),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto Lorem Ipsum es simplemente el texto de relleno.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.withOpacity(0.9),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Text(
                    "Facilities",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      5,
                      (index) => Row(
                        children: [
                          const SizedBox(width: 15),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: const Image(
                                image: AssetImage('assets/1.jpg'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Column(
                      children: const [
                        Text(
                          "Price",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "\$750",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xfffd6d7a),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      width: 150,
                      height: 50,
                      child: const Center(
                        child: Text(
                          'Book Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                )
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
