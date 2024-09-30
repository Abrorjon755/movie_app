import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/movie/data/movie_repository.dart';
import '../../features/movie_detail/data/movie_detail_repository.dart';
import '../../features/search/data/search_repository.dart';
import '../constants/constants.dart';
import '../dependency/app_dependencies.dart';
import '../service/api_service.dart';
import '../service/db_service.dart';

class InitializeApp {
  const InitializeApp();

  Future<AppDependencies> initialize() async {
    /// Initial Settings
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    /// Local Settings
    final shp = await SharedPreferences.getInstance();
    final db = await DBService.initialize();

    bool theme = shp.getBool(Constants.getTheme) ?? false;
    bool locale = shp.getBool(Constants.getLocale) ?? false;


    /// API Service

    final dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        connectTimeout: const Duration(seconds: 300),
        receiveTimeout: const Duration(seconds: 300),
      ),
    );

    final apiService = ApiService(dio: dio);

    final movieRepository = MovieRepositoryImpl(apiService: apiService);
    final searchRepository = SearchRepositoryImpl(apiService: apiService);
    final movieDetailRepository =
        MovieDetailRepositoryImpl(apiService: apiService);

    /// Dependencies
    return AppDependencies(
      apiService: apiService,
      movieRepository: movieRepository,
      searchRepository: searchRepository,
      movieDetailRepository: movieDetailRepository,
      db: db,
      theme: theme,
      locale: locale,
      shp: shp,
      dio: dio,
    );
  }
}
