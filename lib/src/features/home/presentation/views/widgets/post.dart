import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => context.go('/home/0/post/1'),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                      fit: BoxFit.fitWidth,
                      width: double.infinity,
                      height: 220,
                      "https://images.adsttc.com/media/images/5efe/1f7f/b357/6540/5400/01d7/newsletter/archdaily-houses-104.jpg"),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white.withOpacity(.6),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    child: const Text(
                      "NEW - 6 MIN AGO",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.heart,
                      color: Colors.white,
                      shadows: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 10,
                          offset: Offset(0, 0),
                          spreadRadius: 10,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$6,995/mo', style: textStyle.titleMedium),
                const Icon(FontAwesomeIcons.ellipsis)
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Row(
                  children: [
                    const Icon(FontAwesomeIcons.bed, size: 15),
                    const SizedBox(width: 10),
                    Text('4bd', style: textStyle.bodyMedium)
                  ],
                ),
                const SizedBox(width: 20),
                Row(children: [
                  const Icon(FontAwesomeIcons.bath, size: 15),
                  const SizedBox(width: 5),
                  Text('1ba', style: textStyle.bodyMedium)
                ])
              ],
            ),
            const Text('150 E 2nd St #1C, New York, NY 10009'),
            const Text('East Village, New York, NY'),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "CHECK AVAILABILITY",
              ),
            )
          ],
        ),
      ),
    );
  }
}
