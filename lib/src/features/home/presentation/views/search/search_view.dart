import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rest_house_rd/src/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:rest_house_rd/src/features/home/presentation/views/widgets/posts.dart';

class SeachView extends StatelessWidget {
  const SeachView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: const CustomAppBar(),
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
        body: const Posts(),
      ),
    );
  }
}
