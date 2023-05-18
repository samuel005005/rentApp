import 'package:flutter/material.dart';

import 'widgets/feeds.dart';

class FeedView extends StatefulWidget {
  const FeedView({super.key});

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
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

  @override
  bool get wantKeepAlive => true;
}
