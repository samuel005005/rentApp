import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:rest_house_rd/src/ui/home/widgets/details_post.dart';
import 'package:rest_house_rd/src/ui/home/widgets/icon_notification.dart';
import 'package:rest_house_rd/src/ui/home/widgets/location.dart';
import 'package:rest_house_rd/src/ui/home/widgets/post.dart';
import 'package:rest_house_rd/src/ui/home/widgets/search.dart';
import 'package:rest_house_rd/src/ui/widgets/my_dropdrown.dart';
import 'package:rest_house_rd/src/ui/widgets/rating.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final _width = screen.width;
    final _height = screen.height;

    print('_width---> $_width');
    print('_height---> $_height');
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            colors: [
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Color(0xfff5f7f8),
              Color(0xfff9fafb),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                          width: double.infinity,
                          height: _height > 411 ? 100 : 80),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: MyDropdown(
                          text: "Location",
                          fontSize: 18,
                          width: 140,
                          iconSize: 18,
                        ),
                      ),
                      const Positioned(
                        top: 25,
                        right: 15,
                        child: IconNotification(iconSize: 30),
                      ),
                      const Positioned(
                        bottom: 0,
                        child: Location(
                          locationText: "Solo, Indonesia",
                          iconSize: 35,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Search(
                      placeHolder: 'Search favorite house...', iconSize: 28),
                  const SizedBox(height: 10),
                ],
              ),
              Flexible(
                fit: FlexFit.tight,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      width: screen.width,
                      height: screen.height * .46,
                      child: PageView(
                        physics: const BouncingScrollPhysics(),
                        controller: PageController(
                          viewportFraction: 0.8,
                        ),
                        children: List.generate(
                          5,
                          (index) => const Post(
                            image: "assets/1.jpg",
                            title: "Masara House",
                            direction: "Mojolaban, Solo",
                            details: [
                              DetailPost(
                                  description: "4 Bedroom",
                                  iconData: Ionicons.bed),
                              SizedBox(width: 10),
                              DetailPost(
                                  description: "Wifi", iconData: Ionicons.wifi),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const PopularHouse()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PopularHouse extends StatelessWidget {
  const PopularHouse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Popular House",
            style: TextStyle(
              color: Colors.black.withOpacity(.7),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: const Image(
                      image: AssetImage("assets/1.jpg"),
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 100),
                    Text(
                      "Valito House",
                      style: TextStyle(
                        color: Colors.black.withOpacity(.7),
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Benowo, Surabaya",
                      style: TextStyle(
                        color: Colors.black.withOpacity(.3),
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Rating(
                      onRatingSelected: (rating) {},
                      maximumRating: 5,
                      size: 17,
                    ),
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
