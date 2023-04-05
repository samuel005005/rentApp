import 'package:animate_do/animate_do.dart';
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
  late Animation<double> falling;
  late Animation<double> bouncing;

  @override
  void initState() {
    _currentImage = 'assets/0.jpg';
    animateController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));

    falling = Tween<double>(begin: -200, end: -50).animate(CurvedAnimation(
        parent: animateController,
        curve: const Interval(0, 0.3, curve: Curves.linear)));

    bouncing = Tween<double>(begin: -50, end: 0).animate(CurvedAnimation(
        parent: animateController,
        curve: const Interval(0.3, 1, curve: Curves.elasticOut)));

    super.initState();
  }

  @override
  void dispose() {
    animateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final double backButtonSize = screen.width * 0.121654501;

    animateController.forward();
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: animateController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(
                    falling.value == -50 ? bouncing.value : falling.value, 0),
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
            top: 35,
            left: 20,
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
