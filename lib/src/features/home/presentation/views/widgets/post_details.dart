import 'package:animate_do/animate_do.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:ionicons/ionicons.dart';
import 'package:rest_house_rd/src/config/theme/colors.dart';
import 'package:rest_house_rd/src/data.dart';
import 'package:rest_house_rd/src/features/home/presentation/providers/home_model_provider.dart';

import 'package:rest_house_rd/src/features/home/presentation/views/search/map_view.dart';
import 'package:rest_house_rd/src/features/shared/presentation/provider/theme_provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class PostDetails extends ConsumerStatefulWidget {
  static const name = 'post-details';
  final String postId;
  const PostDetails({super.key, required this.postId});

  @override
  PostDetailsState createState() => PostDetailsState();
}

class PostDetailsState extends ConsumerState<PostDetails>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> enlarge;
  late Animation<double> opacity;
  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));

    enlarge = Tween(begin: 1.0, end: 0.8).animate(animationController);
    opacity = Tween(begin: 1.0, end: 0.0).animate(animationController);
    animationController.addListener(() {
      if (kDebugMode) {
        print('Status: ${animationController.status}');
      }
    });

    ref.read(homeModelProvider.notifier).controller = animationController;

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          const _CustomSliverAppBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => const _PostDetails(),
              childCount: 1,
            ),
          ),
        ],
      ),
      bottomSheet: AnimatedBuilder(
        animation: animationController,
        child: const StickButton(),
        builder: (context, childRentangle) {
          final bool visible = opacity.value < 1 ? false : true;
          return Visibility(
            visible: visible,
            child: Transform.scale(
              scale: enlarge.value,
              child: childRentangle,
            ),
          );
        },
      ),
    );
  }
}

class StickButton extends StatelessWidget {
  final bool rounded;
  const StickButton({super.key, this.rounded = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(rounded ? 10 : 0),
        color: Colors.red,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.mail_outline, color: Colors.white),
          SizedBox(width: 10),
          Text(
            "CHECK AVAILABILITY",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class _CustomSliverAppBar extends ConsumerWidget {
  const _CustomSliverAppBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final isDark = ref.read(isDarkProvider);
    final appBarHeight =
        MediaQuery.of(context).size.height * .4 - AppBar().preferredSize.height;
    return Theme(
      data: ThemeData(
        primaryIconTheme: const IconThemeData(),
      ),
      child: SliverLayoutBuilder(builder: (context, constraints) {
        final scrolled = constraints.scrollOffset + 10 >= appBarHeight;
        Color color = Colors.white;

        if (scrolled) {
          if (isDark) {
            color = Colors.white;
          } else {
            color = Colors.black;
          }
        }
        return SliverAppBar(
          elevation: 0,
          backgroundColor: scaffoldBackgroundColor,
          expandedHeight: size.height * .4,
          foregroundColor: color,
          pinned: true,
          actions: [
            IconButton(
              onPressed: () async {},
              icon: const Icon(Icons.share),
            ),
            IconButton(
              onPressed: () async {},
              icon: const Icon(Icons.favorite_border),
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.only(bottom: 0),
            // title: _CustomGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   stops: const [0.7, 1.0],
            //   colors: [
            //     Colors.transparent,
            //     scaffoldBackgroundColor,
            //   ],
            // ),
            background: Stack(
              children: [
                SizedBox.expand(
                  child: Image.network(
                    "https://images.adsttc.com/media/images/5efe/1f7f/b357/6540/5400/01d7/newsletter/archdaily-houses-104.jpg",
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress != null) {
                        return const SizedBox();
                      }

                      return FadeIn(child: child);
                    },
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.8),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Row(
                      children: [
                        Icon(Ionicons.image_outline,
                            color: Colors.white, size: 17),
                        Text(
                          " 17",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                //* Favorite Gradient Background
                const _CustomGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.0, 0.2],
                  colors: [
                    Colors.black54,
                    Colors.transparent,
                  ],
                ),

                //* Back arrow background
                const _CustomGradient(
                  begin: Alignment.topLeft,
                  stops: [0.0, 0.3],
                  colors: [
                    Colors.black87,
                    Colors.transparent,
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class _PostDetails extends ConsumerStatefulWidget {
  const _PostDetails();

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends ConsumerState<_PostDetails>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> move;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    move = Tween(begin: 20.0, end: 0.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.ease),
    );
    controller.addListener(() {
      if (kDebugMode) {
        print('Status: ${controller.status}');
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final title = Theme.of(context).textTheme.copyWith(
        titleLarge: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        titleMedium:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 15));
    // final animationController = ref.read(homeModelProvider).controller;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _MainInfo(),
          const SizedBox(height: 8),
          Text(
            "\$4,100/mo",
            style: title.titleLarge,
          ),
          const SizedBox(height: 8),
          const Text(
            "13105 40th Rd #8G",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text("Upper  East Side, 40th Rd #8G"),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _TextIcon(icon: Ionicons.bed, text: "3 Beds"),
              _TextIcon(icon: Icons.bathtub, text: "2 Baths"),
              _TextIcon(icon: Icons.square_foot, text: "2,600 sqft"),
            ],
          ),
          const SizedBox(height: 8),
          const _Highlights(),
          const SizedBox(height: 15),
          const _LocalInformation(),
          const SizedBox(height: 15),
          const _Description(),
          const SizedBox(height: 15),
          VisibilityDetector(
            key: const Key('my-widget-key'),
            onVisibilityChanged: (visibilityInfo) {
              if (visibilityInfo.visibleFraction >= 1.0) {
                controller.forward();
                ref.read(homeModelProvider.notifier).controller.forward();
              } else {
                ref.read(homeModelProvider.notifier).controller.reverse();
                controller.reverse();
              }
            },
            child: const SizedBox(height: 1, width: 1),
          ),
          AnimatedBuilder(
            animation: controller,
            child: const StickButton(rounded: true),
            builder: (context, childRentangle) {
              final bool visible = move.value < 20.0 ? true : false;
              print(visible);
              return Visibility(
                visible: visible,
                child: Transform.translate(
                  offset: Offset(0, move.value),
                  child: childRentangle,
                ),
              );
            },
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description();

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        ExpandableText(
          textTemp,
          expandText: 'More',
          collapseText: 'Less',
          maxLines: 4,
          linkColor: Colors.blue,
        ),
      ],
    );
  }
}

class _Highlights extends StatelessWidget {
  const _Highlights();

  @override
  Widget build(BuildContext context) {
    final title = Theme.of(context).textTheme.copyWith(
        titleLarge: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        titleMedium:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 15));

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Home Highlights", style: title.titleMedium),
          const SizedBox(height: 15),
          Table(
            children: [
              TableRow(
                children: [
                  const Column(children: [
                    _TextIcon(icon: Icons.pets, text: "Pets"),
                  ]),
                  Column(children: [
                    Text("No", style: title.titleMedium),
                  ]),
                ],
              ),
              TableRow(
                children: [
                  const Column(children: [
                    _TextIcon(icon: Icons.garage_rounded, text: "Parking"),
                  ]),
                  Column(children: [
                    Text("Yes", style: title.titleMedium),
                  ]),
                ],
              ),
              TableRow(
                children: [
                  const Column(children: [
                    _TextIcon(
                        icon: FontAwesomeIcons.uikit,
                        text: "Ultilities Include"),
                  ]),
                  Column(children: [
                    Text("Contact Manager", style: title.titleMedium),
                  ]),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MainInfo extends StatelessWidget {
  const _MainInfo();

  @override
  Widget build(BuildContext context) {
    final tagStyle = TextStyle(
        color: ColorsApp.foregroundColor, fontWeight: FontWeight.bold);
    return Row(
      children: [
        Text("FOR RENT", style: tagStyle),
        const SizedBox(width: 15),
        Text("NEW", style: tagStyle),
        const SizedBox(width: 15),
        Text("OPEN FRI, 12-5:545PM", style: tagStyle),
      ],
    );
  }
}

class _TextIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  const _TextIcon({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [Icon(icon), const SizedBox(width: 5), Text(text)]);
  }
}

class _CustomGradient extends StatelessWidget {
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<double> stops;
  final List<Color> colors;

  const _CustomGradient({
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
    required this.stops,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: begin,
            end: end,
            stops: stops,
            colors: colors,
          ),
        ),
      ),
    );
  }
}

class _LocalInformation extends StatelessWidget {
  const _LocalInformation();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Local Information",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
          decoration: BoxDecoration(
              color: ColorsApp.foregroundColor,
              borderRadius: BorderRadius.circular(15)),
          child: const Text("Map View",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        const SizedBox(height: 15),
        const SizedBox(
          height: 200,
          child: MapViewWidget(preview: true),
        )
      ],
    );
  }
}
