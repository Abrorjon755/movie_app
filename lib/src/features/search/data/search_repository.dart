import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../../common/constants/constants.dart';
import '../../../common/models/movies_model.dart';
import '../../../common/service/api_service.dart';

abstract interface class ISearchRepository {
  Future<List<MovieModel>> getMovies({
    required int page,
    required String text,
  });
}

class SearchRepositoryImpl implements ISearchRepository {
  const SearchRepositoryImpl({required this.apiService});

  final ApiService apiService;

  @override
  Future<List<MovieModel>> getMovies({
    required int page,
    required String text,
  }) async {
    try {
      final response = await apiService.request(
        Constants.pathSearch,
        queryParams: {
          'query': text,
          'page': '$page',
        },
      );

      final json = const JsonDecoder()
          .cast<String, Map<String, Object?>>()
          .convert(response ?? '');

      final movies = List<Map<String, Object?>>.from(
        (json['results'] as List),
      ).map(MovieModel.fromJson).toList();

      return movies;
    } on Object catch (e, s) {
      if (kDebugMode) {
        print("$e\n$s");
      }
      return [];
    }
  }
}
