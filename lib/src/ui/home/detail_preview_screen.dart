import 'package:flutter/material.dart';

class DetailPreviewScreen extends StatefulWidget {
  const DetailPreviewScreen({super.key});

  @override
  State<DetailPreviewScreen> createState() => _DetailPreviewScreenState();
}

class _DetailPreviewScreenState extends State<DetailPreviewScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animateController;

  late String _currentImage;
  late Animation<double> animation;

  @override
  void initState() {
    _currentImage = 'assets/0.jpg';
    animateController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 120));

    animation = Tween<double>(begin: -100, end: 0).animate(
        CurvedAnimation(parent: animateController, curve: Curves.easeOut));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    animateController.forward();
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: animateController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(animation.value, 0),
                child: Image(
                  width: screen.width,
                  height: screen.height,
                  fit: BoxFit.fill,
                  image: AssetImage(_currentImage),
                ),
              );
            },
          ),
          Positioned(
            top: screen.height * .78,
            left: 20,
            child: const Text(
              "Detail Preview",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          Positioned(
            bottom: 35,
            child: SizedBox(
              width: screen.width,
              height: 100,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  5,
                  (index) => GestureDetector(
                      onTap: () async {
                        _currentImage = 'assets/$index.jpg';
                        setState(() {});
                        animateController.reset();
                        animateController.forward();
                        print(animateController.status);
                      },
                      child:
                          SmallImage(url: 'assets/small/$index.jpg')), //110x100
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SmallImage extends StatelessWidget {
  final String url;
  const SmallImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 30,
                offset: Offset(0, 0),
                spreadRadius: -30,
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: AssetImage(url),
            ),
          ),
        ),
      ),
    );
  }
}
