import 'dart:convert';

import 'package:movie_app/main.dart';
import 'package:movie_app/src/common/constants/constants.dart';
import 'package:movie_app/src/common/service/api_service.dart';

abstract interface class IHomeRepository {
  const IHomeRepository();

  void getNowPlaying();
}

class HomeRepositoryImpl implements IHomeRepository {
  const HomeRepositoryImpl({required this.apiService});

  final ApiService apiService;

  @override
  void getNowPlaying() async {
    final queryParams = {
      ...Constants.apiKey,
      "language": shp.getString(Constants.getLocale) ?? "en",
    };
    final response = await apiService.request(
      "${Constants.pathSingleMovie}/11",
      queryParams: queryParams,
    );
  }
}
