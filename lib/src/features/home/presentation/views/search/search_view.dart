import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:rest_house_rd/src/config/theme/colors.dart';
import 'package:rest_house_rd/src/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:rest_house_rd/src/features/home/presentation/views/widgets/posts.dart';

import 'map_view.dart';

class SeachView extends StatefulWidget {
  const SeachView({super.key});

  @override
  State<SeachView> createState() => _SeachViewState();
}

class _SeachViewState extends State<SeachView>
    with AutomaticKeepAliveClientMixin {
  bool isMap = false;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: const CustomAppBar(),
          bottom: TabBar(
            indicatorColor: ColorsApp.foregroundColor,
            labelColor: ColorsApp.foregroundColor,
            onTap: changeScreen,
            tabs: [
              isMap
                  ? const Tab(text: 'LIST RESULTS')
                  : const Tab(text: 'MAP RESULTS'),
              const Tab(text: 'SORT BY'),
              const Tab(text: 'SAVE SEARCH'),
            ],
          ),
        ),
        body: FadeIn(
          animate: true,
          child: isMap ? const MapViewWidget() : const Posts(),
        ),
      ),
    );
  }

  void changeScreen(int value) {
    switch (value) {
      case 0:
        isMap = !isMap;
        setState(() {});
        break;
      default:
    }
  }

  @override
  bool get wantKeepAlive => true;
}
