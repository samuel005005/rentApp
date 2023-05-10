import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

import 'package:rest_house_rd/src/config/theme/colors.dart';
import 'package:rest_house_rd/src/features/shared/presentation/widgets/rating.dart';

class DetailPostScreen extends StatelessWidget {
  const DetailPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final maxHeight = screen.height * .45;
    final minHeight = screen.height * .44;
    final width = screen.width;

    final double backButtonSize = width * 0.121654501;
    final double containerSizeTitle = maxHeight * 0.316169828;
    final double sizeTitle = maxHeight * 0.057;
    final double facileSize = maxHeight * 0.263474857;

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
                        context.go('');
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
                          width: backButtonSize,
                          height: backButtonSize,
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
                  height: containerSizeTitle,
                  child: Stack(
                    children: [
                      Text(
                        "Apartamento alquiler",
                        style: TextStyle(
                          fontSize: sizeTitle,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 15,
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
                            Icon(
                              Ionicons.location_sharp,
                              size: sizeTitle / 1.3,
                              color: ColorsApp.primaryColor,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Santo Domingo Norte",
                              style: TextStyle(
                                fontSize: sizeTitle / 1.3,
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
                    'Apto. Nuevo para estrenar,  2do. Piso, 3 habitaciónes, un baño, sala comedor, cocina, área de lavado, balcon, un parqueo.',
                    style: TextStyle(
                      fontSize: sizeTitle / 1.6,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.withOpacity(0.9),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Text(
                    "Instalaciones",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: sizeTitle / 1.2,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: facileSize,
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
                SizedBox(height: facileSize * 0.35),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        const Text(
                          "Precio",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "RD\$9,000",
                          style: TextStyle(
                            fontSize: sizeTitle,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    SizedBox(
                      width: width * 0.364963504,
                      height: maxHeight * 0.131752306,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Contactar',
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
