import 'package:flutter/material.dart';
import 'package:rest_house_rd/src/features/home/presentation/views/widgets/post.dart';

class Posts extends StatelessWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Post();
      },
    );
  }
}
