import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rest_house_rd/src/ui/widgets/my_dropdrown.dart';

import '../widgets/rating.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            colors: [
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
                  _TextLocation(),
                  _IconNotification(),
                  _Location()
                ],
              ),
              const SizedBox(height: 25),
              const _Search(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      _Post(),
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

class _Post extends StatelessWidget {
  const _Post();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 320,
        height: 400,
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: const Image(
                  image: AssetImage("assets/1.jpg"),
                  fit: BoxFit.contain,
                  height: 250,
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  const Positioned(
                    left: 0,
                    child: Text(
                      "Masara House",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 20,
                    child: Rating(
                      onRatingSelected: (rating) {},
                      maximumRating: 5,
                    ),
                  ),
                  const Positioned(
                    left: 0,
                    top: 40,
                    child: Text(
                      "Mojolaban, Solo",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  // Row(children: []),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  height: 10,
                  decoration: const BoxDecoration(color: Colors.black),
                  child: Row(
                    children: [],
                  ),
                )
              ],
            )
          ],
        ),
      ),
      // child: Card(
      //   elevation: 1,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(15.0),
      //   ),
      //   child: Column(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(20),
      //         child: ClipRRect(
      //           borderRadius: BorderRadius.circular(15),
      //           child: const Image(
      //             image: AssetImage("assets/1.jpg"),
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}

class _Search extends StatelessWidget {
  const _Search();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 30),
        Expanded(
          child: TextField(
            cursorColor: const Color(0xfffd6d7a),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  width: 1,
                  color: Color(0xffededee),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  width: 1,
                  color: Color(0xfffd6d7a),
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Color.fromARGB(255, 66, 125, 145),
                ),
              ),
              hintText: 'Search favorite house...',
              hintStyle: const TextStyle(
                color: Color(0xffd4d4d4),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xfffd6d7a),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 50,
                spreadRadius: -15,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Container(
            alignment: Alignment.center,
            height: 100,
            child: const Icon(
              Ionicons.search_outline,
              size: 32,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}

class _Location extends StatelessWidget {
  const _Location({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: const [
                Icon(
                  Ionicons.location_sharp,
                  size: 35,
                  color: Color(0xfffd6d7a),
                ),
                SizedBox(width: 18),
                Text(
                  "Solo, Indonesia",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _IconNotification extends StatelessWidget {
  const _IconNotification();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      right: 15,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 50,
                  spreadRadius: -15,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: const Icon(
                    Ionicons.notifications,
                    size: 25,
                    color: Color(0xff130f26),
                  ),
                ),
                Positioned(
                  top: 15,
                  right: 15,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xffcecdd2),
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    alignment: Alignment.center,
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.red,
                    ),
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

class _TextLocation extends StatelessWidget {
  const _TextLocation();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: MyDropdown(text: "Location"),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
