import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/src/common/constants/constants.dart';
import 'package:movie_app/src/common/dependency/app_dependencies.dart';
import 'package:movie_app/src/common/service/api_service.dart';
import 'package:movie_app/src/features/home/data/home_repository.dart';

extension ContextX on BuildContext {
  AppDependencies get dependencies {
    final dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
      ),
    );

    final apiService = ApiService(dio: dio);

    return AppDependencies(
      apiService: apiService,
      homeRepository: HomeRepositoryImpl(apiService: apiService),
    );
  }
}
