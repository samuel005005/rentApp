import 'package:flutter/material.dart';
import 'package:rest_house_rd/src/config/theme/colors.dart';
import 'package:rest_house_rd/src/features/home/presentation/views/widgets/post.dart';

class Feeds extends StatelessWidget {
  const Feeds({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Row(
              children: [
                const SizedBox(width: 15),
                Icon(Icons.star, color: ColorsApp.foregroundColor),
                const SizedBox(width: 10),
                Text('New Home in New York', style: textStyle.titleMedium),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 15),
                Text('Matches your saved search', style: textStyle.bodySmall),
              ],
            ),
            const Post(),
          ],
        );
      },
    );
  }
}
