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
    final width = screen.width;
    final height = screen.height;

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
                          height: height > 411 ? 100 : 80),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: MyDropdown(
                          text: "Location",
                          fontSize: width * 0.040,
                          width: width * 0.31,
                          iconSize: width * 0.043,
                        ),
                      ),
                      Positioned(
                        top: height * 0.03,
                        right: width * 0.04,
                        child: IconNotification(iconSize: width * 0.08),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Location(
                          locationText: "Solo, Indonesia",
                          iconSize: width * 0.08,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: height * 0.03),
                  Search(
                      placeHolder: 'Search favorite house...',
                      iconSize: width * 0.07),
                  SizedBox(height: height * 0.03),
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
                          (index) => Post(
                            image: "assets/1.jpg",
                            title: "Masara House",
                            direction: "Mojolaban, Solo",
                            details: [
                              const DetailPost(
                                  description: "4 Bedroom",
                                  iconData: Ionicons.bed),
                              SizedBox(width: width * 0.025),
                              const DetailPost(
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
    final screen = MediaQuery.of(context).size;
    final width = screen.width;
    final height = screen.height;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Popular House",
            style: TextStyle(
              color: Colors.black.withOpacity(.7),
              fontSize: width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: height * 0.019),
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
                  padding: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      image: const AssetImage("assets/1.jpg"),
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
                      "Valito House",
                      style: TextStyle(
                        color: Colors.black.withOpacity(.7),
                        fontSize: width * 0.043,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: height * 0.012),
                    Text(
                      "Benowo, Surabaya",
                      style: TextStyle(
                        color: Colors.black.withOpacity(.3),
                        fontSize: width * 0.043,
                      ),
                    ),
                    SizedBox(height: height * 0.012),
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
