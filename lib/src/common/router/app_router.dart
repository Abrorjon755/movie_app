import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/screen/home_screen.dart';
import '../../features/movie/screen/movie_screen.dart';
import '../../features/movie_detail/screen/movie_detail.dart';
import '../../features/search/screen/search_screen.dart';
import '../../features/settings/screen/change_language.dart';
import '../../features/settings/screen/change_theme.dart';
import '../../features/settings/screen/settings_screen.dart';
import '../../features/watch_list/screen/watch_list_screen.dart';
import '../models/movies_model.dart';
import '../widgets/full_screen_image.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  const AppRouter._();

  static const String home = '/home';

  static const String movie = "/movie";
  static const String search = "/search";
  static const String watchList = "/watch_list";
  static const String movieItem = "/movie_detail";
  static const String settings = "/settings";
  static const String settingsTheme = "/settingsTheme";
  static const String settingsLanguage = "/settingsLanguage";

  static const String fullScreenImage = "/full_screen_image";
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
        GoRoute(
          path: AppRouter.fullScreenImage,
          name: AppRouter.fullScreenImage,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: FullScreenImage(imageUrl: state.extra as String),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: AppRouter.settings,
          name: AppRouter.settings,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const SettingsScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(-1.0, 0.0);
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
          path: AppRouter.settingsTheme,
          name: AppRouter.settingsTheme,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: ChangeTheme(theme: state.extra as bool),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(-1.0, 0.0);
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
          path: AppRouter.settingsLanguage,
          name: AppRouter.settingsLanguage,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: ChangeLanguage(isEn: state.extra as bool),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(-1.0, 0.0);
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
