import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../../common/constants/constants.dart';
import '../../../common/models/movies_model.dart';
import '../../../common/service/api_service.dart';

abstract interface class IMovieRepository {
  const IMovieRepository._();

  Future<List<MovieModel>> getNowPlaying();

  Future<List<MovieModel>> getMovies(
      {required String categoryName, int page = 1});
}

class MovieRepositoryImpl implements IMovieRepository {
  const MovieRepositoryImpl({required this.apiService});

  final ApiService apiService;

  @override
  Future<List<MovieModel>> getMovies(
      {required String categoryName, int page = 1}) async {
    try {
      Map<String, Object?> queryParams = {
        "page": page,
      };
      final response = await apiService.request(
        categoryName,
        queryParams: queryParams,
      );
      final Map<String, Object?> json = jsonDecode(response ?? '');
      List<MovieModel> result = (json["results"] as List<dynamic>)
          .map((e) => MovieModel.fromJson(e))
          .toList();
      return result;
    } on Object catch (e, s) {
      if (kDebugMode) {
        print("$e\n$s");
      }
      return [];
    }
  }

  @override
  Future<List<MovieModel>> getNowPlaying() async {
    try {
      Map<String, Object?> queryParams = {
        "page": 1,
      };
      final response = await apiService.request(
        Constants.pathNowPlaying,
        queryParams: queryParams,
      );
      final Map<String, Object?> json = jsonDecode(response ?? '');
      List<MovieModel> result = (json["results"] as List<dynamic>)
          .map((e) => MovieModel.fromJson(e))
          .take(9)
          .toList();
      return result;
    } on Object catch (e, s) {
      if (kDebugMode) {
        print("$e\n$s");
      }
      return [];
    }
  }
}
