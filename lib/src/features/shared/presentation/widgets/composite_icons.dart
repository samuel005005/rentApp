import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';

class SeachHomeIcon extends StatelessWidget {
  const SeachHomeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 50,
      height: 30,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Icon(Icons.home, color: Color(0xff4da89e)),
          Positioned(
            top: -2,
            right: 0,
            child: Icon(
              Icons.search,
              color: Color(0xff1f4329),
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}

class SavesLocationIcon extends StatelessWidget {
  const SavesLocationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 50,
      height: 30,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Icon(
            Ionicons.heart,
            color: Color(0xff6e1632),
          ),
          Positioned(
            bottom: 4,
            left: 23,
            child: Icon(
              Ionicons.location,
              color: Color(0xffe9906c),
              size: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class AlertNotification extends StatelessWidget {
  const AlertNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 50,
      height: 30,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 3,
            left: 10,
            child: Icon(
              Ionicons.sunny,
              color: Color(0xffc3d04e),
              size: 18,
            ),
          ),
          Icon(
            Ionicons.notifications,
            color: Color(0xff051b7c),
          ),
        ],
      ),
    );
  }
}

class MoreOptionIcon extends StatelessWidget {
  const MoreOptionIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 50,
      height: 30,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Icon(
            FontAwesomeIcons.ellipsis,
            color: Color(0xffee946d),
          ),
        ],
      ),
    );
  }
}

class FeedIcon extends StatelessWidget {
  const FeedIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 50,
      height: 30,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 3,
            right: 9,
            child: Icon(
              Ionicons.sunny,
              color: Color(0xffcebdfd),
              size: 18,
            ),
          ),
          Icon(
            FontAwesomeIcons.house,
            color: Color(0xff051b7c),
            size: 18,
          ),
          Positioned(
            bottom: 3,
            left: 8,
            child: Icon(
              FontAwesomeIcons.tree,
              color: Color(0xffc3d04e),
              size: 13,
            ),
          ),
        ],
      ),
    );
  }
}
