import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:rest_house_rd/src/ui/home/widgets/details_post.dart';
import 'package:rest_house_rd/src/ui/home/widgets/icon_notification.dart';
import 'package:rest_house_rd/src/ui/home/widgets/location.dart';
import 'package:rest_house_rd/src/ui/home/widgets/post.dart';
import 'package:rest_house_rd/src/ui/home/widgets/search.dart';
import 'package:rest_house_rd/src/ui/home/widgets/text_location.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: const [
                  SizedBox(height: 100),
                  TextLocation(textLocation: "Location"),
                  IconNotification(),
                  Location(
                    locationText: "Solo, Indonesia",
                  )
                ],
              ),
              const SizedBox(height: 25),
              const Search(placeHolder: 'Search favorite house...'),
              const SizedBox(height: 25),
              const Expanded(
                child: SingleChildScrollView(
                  child: Post(
                    image: "assets/1.jpg",
                    title: "Masara House",
                    direction: "Mojolaban, Solo",
                    details: [
                      DetailPost(
                          description: "4 Bedroom", iconData: Ionicons.bed),
                      SizedBox(width: 10),
                      DetailPost(description: "Wifi", iconData: Ionicons.wifi),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
