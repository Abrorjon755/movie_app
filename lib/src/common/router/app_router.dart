import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/screen/home_screen.dart';
import '../../features/movie/screen/movie_screen.dart';
import '../../features/movie_detail/screen/movie_detail.dart';
import '../../features/search/screen/search_screen.dart';
import '../../features/watch_list/screen/watch_list_screen.dart';
import '../models/movies_model.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  const AppRouter._();

  static const String home = '/home';

  static const String movie = "/movie";
  static const String search = "/search";
  static const String watchList = "/watch_list";
  static const String movieItem = "/movie_detail";
}

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: AppRouter.movie,
  routes: [
    ShellRoute(
      parentNavigatorKey: navigatorKey,
      builder: (context, state, navigationShell) => HomeScreen(
        child: navigationShell,
      ),
      routes: [
        GoRoute(
          path: AppRouter.movie,
          name: AppRouter.movie,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: MovieScreen(onPressed: (v) => v),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              final tween = Tween(begin: begin, end: end);
              final offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: AppRouter.search,
          name: AppRouter.search,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const SearchScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              final tween = Tween(begin: begin, end: end);
              final offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: AppRouter.watchList,
          name: AppRouter.watchList,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const WatchListScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              final tween = Tween(begin: begin, end: end);
              final offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: AppRouter.movieItem,
          name: AppRouter.movieItem,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: MovieDetail(movie: state.extra as MovieModel),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, -1.0);
              const end = Offset.zero;
              final tween = Tween(begin: begin, end: end);
              final offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          ),
        ),
      ],
    ),
  ],
);
