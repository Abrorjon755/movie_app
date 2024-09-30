import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../../common/constants/constants.dart';
import '../../../common/models/actor.dart';
import '../../../common/models/genre.dart';
import '../../../common/models/movie.dart';
import '../../../common/service/api_service.dart';

abstract interface class IMovieDetailRepository {
  const IMovieDetailRepository._();

  Future<List<Genre>> getGenre();

  Future<List<String>> getImages(int id);

  Future<List<Movie>> getMovie(int id);

  Future<List<Actor>> getActors(int id);
}

class MovieDetailRepositoryImpl implements IMovieDetailRepository {
  const MovieDetailRepositoryImpl({required this.apiService});

  final ApiService apiService;

  @override
  Future<List<Genre>> getGenre() async {
    try {
      final response = await apiService.request(
        Constants.genre,
      );

      final result = const JsonDecoder()
          .cast<String, Map<String, Object?>>()
          .convert(response ?? '');

      return List<Map<String, Object?>>.from(result['genres'] as List)
          .whereType<Map<String, Object?>>()
          .map(Genre.fromJson)
          .toList();
    } on Object catch (e, s) {
      if (kDebugMode) {
        print('$e\n$s');
      }
      return [];
    }
  }

  @override
  Future<List<String>> getImages(int id) async {
    try {
      final response = await apiService.request(
        "${Constants.pathSingleMovie}/$id/images",
        queryParams: {
          ...Constants.apiKey,
          "include_image_language": 'null',
        },
      );

      final result = const JsonDecoder()
          .cast<String, Map<String, Object?>>()
          .convert(response ?? '');

      return List<Map<String, Object?>>.from(result['backdrops'] as List)
          .whereType<Map<String, Object?>>()
          .map((e) => e["file_path"] as String)
          .toList();
    } on Object catch (e, s) {
      if (kDebugMode) {
        print("$e\n$s");
      }
      return [];
    }
  }

  @override
  Future<List<Movie>> getMovie(int id) async {
    try {
      final response = await apiService.request(
        "${Constants.pathSingleMovie}/$id",
      );
      return [Movie.fromJson(jsonDecode(response ?? ''))];
    } on Object catch (e, s) {
      if (kDebugMode) {
        print("$e\n$s");
      }
      return [];
    }
  }

  @override
  Future<List<Actor>> getActors(int id) async {
    try {
      final response = await apiService.request(
        "${Constants.pathSingleMovie}/$id/credits",
        queryParams: {
          ...Constants.apiKey,
        },
      );

      final result = const JsonDecoder()
          .cast<String, Map<String, Object?>>()
          .convert(response ?? '');

      return List<Map<String, Object?>>.from(result['cast'] as List)
          .whereType<Map<String, Object?>>()
          .map(Actor.fromMap)
          .toList();
    } on Object catch (e, s) {
      if (kDebugMode) {
        print("$e\n$s");
      }
      return [];
    }
  }
}
