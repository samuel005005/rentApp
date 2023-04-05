import 'package:flutter/material.dart';

import 'package:rest_house_rd/src/ui/home/home_screen.dart';
import 'package:rest_house_rd/src/ui/post/detail_preview_screen.dart';
import 'package:rest_house_rd/src/ui/post/details_post_screen.dart';
import 'package:rest_house_rd/src/ui/routes/app_routes.dart';

class AppPages {
  static Map<String, WidgetBuilder> pages = {
    AppRoutes.home: (context) => const HomeScreen(),
    AppRoutes.post: (context) => const DetailPostScreen(),
    AppRoutes.postView: (context) => const DetailPreviewScreen(),
  };
}
