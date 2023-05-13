import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  static const name = 'post-details';
  final String postId;
  const PostDetails({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppBar(),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (context, index) => _MovieDetails(),
          //     childCount: 1,
          //   ),
          // )
        ],
      ),
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  const _CustomSliverAppBar();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    return Theme(
      data: ThemeData(
        primaryIconTheme: const IconThemeData(),
      ),
      child: SliverAppBar(
        // backgroundColor: Colors.black,
        expandedHeight: size.height * .5,
        // foregroundColor: Colors.white,

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
      ),
    );
  }
}

class _MovieDetails extends StatelessWidget {
  const _MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
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
