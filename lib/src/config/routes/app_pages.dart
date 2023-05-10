import 'package:flutter/material.dart';
import 'package:rest_house_rd/src/features/auth/presentation/screens/login.dart';
import 'package:rest_house_rd/src/features/home/presentation/screen/home_screen.dart';
import 'package:rest_house_rd/src/features/post/presentation/detail_preview_screen.dart';
import 'package:rest_house_rd/src/features/post/presentation/details_post_screen.dart';

import 'app_routes.dart';

class AppPages {
  static Map<String, WidgetBuilder> pages = {
    AppRoutes.home: (_) => const HomeScreen(),
    AppRoutes.post: (_) => const DetailPostScreen(),
    AppRoutes.postView: (_) => const DetailPreviewScreen(),
    AppRoutes.login: (_) => const Login(),
  };
}
