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
      final response = await apiService.request(
        categoryName,
        queryParams: {"page": page},
      );
      final result = const JsonDecoder()
          .cast<String, Map<String, Object?>>()
          .convert(response ?? '');
      return List<Map<String, Object?>>.from(result['results'] as List)
          .whereType<Map<String, Object?>>()
          .map(MovieModel.fromJson)
          .toList();
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
      final response = await apiService.request(
        Constants.pathNowPlaying,
        queryParams: {"page": 1},
      );
      final result = const JsonDecoder()
          .cast<String, Map<String, Object?>>()
          .convert(response ?? '');
      return List<Map<String, Object?>>.from(result['results'] as List)
          .whereType<Map<String, Object?>>()
          .map(MovieModel.fromJson)
          .take(9)
          .toList();
    } on Object catch (e, s) {
      if (kDebugMode) {
        print("$e\n$s");
      }
      return [];
    }
  }
}
