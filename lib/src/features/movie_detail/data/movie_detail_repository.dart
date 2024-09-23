import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../../common/constants/constants.dart';
import '../../../common/models/genre.dart';
import '../../../common/service/api_service.dart';

abstract interface class IMovieDetailRepository {
  const IMovieDetailRepository._();

  Future<List<Genre>> getGenre();
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
}
