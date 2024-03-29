import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rest_house_rd/src/features/home/presentation/screens/home_screen.dart';
import 'package:rest_house_rd/src/features/home/presentation/views/widgets/post_details.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    // ShellRoute(
    //   builder: (context, state, child) {
    //     return HomeScreen(childView: child);
    //   },
    //   routes: [
    //     GoRoute(
    //       path: '/',
    //       builder: (context, state) {
    //         return const HomeView();
    //       },
    //       routes: [
    //         GoRoute(
    //           path: 'movie/:id',
    //           name: MovieScreen.name,
    //           builder: (context, state) {
    //             final movieId = state.params['id'] ?? 'no-id';
    //             return MovieScreen(movieId: movieId);
    //           },
    //         ),
    //       ],
    //     ),
    //     GoRoute(
    //       path: '/favorite',
    //       builder: (context, state) {
    //         return const FavoriteView();
    //       },
    //     )
    //   ],
    // ),
    GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {
        final pageIndex = int.parse(state.pathParameters['page'] ?? '0');
        if (pageIndex > 4 || pageIndex < 0) {
          return const Scaffold(
            body: Center(
              child: Text("Page not Found"),
            ),
          );
        }
        return HomeScreen(
          pageIndex: pageIndex,
        );
      },
      routes: [
        GoRoute(
          path: 'post/:id',
          name: PostDetails.name,
          builder: (context, state) {
            final postId = state.pathParameters['id'] ?? 'no-id';
            return PostDetails(postId: postId);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/',
      redirect: (_, __) => '/home/0',
    )
  ],
);
