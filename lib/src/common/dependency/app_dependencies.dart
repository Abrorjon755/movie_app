import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/movie/data/movie_repository.dart';
import '../../features/movie_detail/data/movie_detail_repository.dart';
import '../../features/search/data/search_repository.dart';
import '../service/api_service.dart';
import '../service/db_service.dart';

class AppDependencies {
  const AppDependencies({
    required this.apiService,
    required this.movieRepository,
    required this.searchRepository,
    required this.movieDetailRepository,
    required this.db,
    required this.theme,
    required this.locale,
    required this.shp,
    required this.dio,
  });

  final ApiService apiService;
  final Dio dio;

  final bool theme;
  final Locale locale;

  final SharedPreferences shp;
  final DBService db;

  final IMovieRepository movieRepository;
  final ISearchRepository searchRepository;
  final IMovieDetailRepository movieDetailRepository;
}
