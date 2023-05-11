import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'widgets/posts.dart';

class SeachView extends StatelessWidget {
  const SeachView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Search"),
          bottom: TabBar(
            onTap: (int value) {
              if (kDebugMode) {
                print(value);
              }
            },
            tabs: const [
              Tab(text: 'MAP RESULTS'),
              Tab(text: 'SORT BY'),
              Tab(text: 'SAVE SEARCH'),
            ],
          ),
        ),
        // body: const Posts(),
        body: const Posts(),
      ),
    );
  }
}
