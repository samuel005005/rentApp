import 'package:flutter/material.dart';

import 'widgets/feeds.dart';

class FeedView extends StatelessWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TuDepaRD',
          style: textStyle.titleLarge,
        ),
      ),
      body: const Feeds(),
    );
  }
}
