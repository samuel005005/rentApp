import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

import 'package:rest_house_rd/src/ui/home/widgets/details_post.dart';
import 'package:rest_house_rd/src/ui/home/widgets/icon_notification.dart';
import 'package:rest_house_rd/src/ui/home/widgets/location.dart';
import 'package:rest_house_rd/src/ui/home/widgets/post.dart';
import 'package:rest_house_rd/src/ui/home/widgets/search.dart';
import 'package:rest_house_rd/src/ui/routes/app_routes.dart';
import 'package:rest_house_rd/src/ui/theme/theme_changer.dart';
import 'package:rest_house_rd/src/ui/widgets/my_dropdrown.dart';
import 'package:rest_house_rd/src/ui/widgets/rating.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final width = screen.width;
    final height = screen.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HomeHeader(height: height, width: width),
            Flexible(
              fit: FlexFit.tight,
              child: BodyHome(height: height, width: width),
            )
          ],
        ),
      ),
    );
  }
}

class BodyHome extends StatelessWidget {
  const BodyHome({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        LastPosts(height: height, width: width),
        const PopularHouses()
      ],
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(width: double.infinity, height: height > 411 ? 100 : 80),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: MyDropdown(
                text: "Localización",
                fontSize: width * 0.040,
                width: width * 0.38,
                iconSize: width * 0.043,
              ),
            ),
            Positioned(
              top: height * 0.03,
              right: width * 0.04,
              child: IconNotification(iconSize: width * 0.06),
            ),
            Positioned(
              bottom: 0,
              child: Location(
                locationText: "Santo Domingo Norte",
                iconSize: width * 0.07,
              ),
            )
          ],
        ),
        SizedBox(height: height * 0.03),
        Search(placeHolder: 'Buscar casa ideal...', iconSize: width * 0.07),
        SizedBox(height: height * 0.03),
      ],
    );
  }
}

class LastPosts extends StatelessWidget {
  const LastPosts({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height * .46,
      child: PageView(
        physics: const BouncingScrollPhysics(),
        controller: PageController(
          viewportFraction: 0.8,
        ),
        children: List.generate(
          5,
          (index) => InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.post);
            },
            child: Post(
              image: "assets/1.jpg",
              title: "RD\$9,000",
              direction: "Santo Domingo Norte",
              details: [
                const DetailPost(
                    description: "2 Habitaciones", iconData: Ionicons.bed),
                SizedBox(width: width * 0.022),
                const DetailPost(
                    description: "1 Baño", iconData: FontAwesomeIcons.bath),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PopularHouses extends StatelessWidget {
  const PopularHouses({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final width = screen.width;
    final height = screen.height;
    final isDark = context.read<ThemeChanger>().isDarkTheme;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Casa Popular",
            style: TextStyle(
              color: (isDark) ? Colors.white : Colors.black.withOpacity(.7),
              fontSize: width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: height * 0.019),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: (isDark) ? Colors.black : Colors.white,
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
            child: PopularHouse(width: width, height: height),
          ),
        ],
      ),
    );
  }
}

class PopularHouse extends StatelessWidget {
  const PopularHouse({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<ThemeChanger>().isDarkTheme;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: const AssetImage("assets/small/1.jpg"),
              fit: BoxFit.cover,
              width: width * 0.25,
              height: height * 0.12,
            ),
          ),
        ),
        SizedBox(width: width * 0.025),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: width * 0.25),
            Text(
              "RD\$5,000",
              style: TextStyle(
                color: (isDark) ? Colors.white : Colors.black.withOpacity(.7),
                fontSize: width * 0.043,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: height * 0.012),
            Text(
              "Barrio Nuevo",
              style: TextStyle(
                color: (isDark)
                    ? Colors.white.withOpacity(.3)
                    : Colors.black.withOpacity(.3),
                fontSize: width * 0.043,
              ),
            ),
            SizedBox(height: height * 0.012),
            Rating(
              onRatingSelected: (rating) {},
              maximumRating: 5,
              size: width * 0.035,
            ),
          ],
        )
      ],
    );
  }
}
