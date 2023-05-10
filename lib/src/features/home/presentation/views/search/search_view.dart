import 'package:flutter/material.dart';

import 'widgets/posts.dart';

class SeachView extends StatelessWidget {
  const SeachView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: const Posts(),
    );
  }
}
