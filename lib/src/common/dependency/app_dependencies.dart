import 'package:movie_app/src/features/home/data/home_repository.dart';

import '../service/api_service.dart';

class AppDependencies {
  const AppDependencies({
    required this.apiService,
    required this.homeRepository,
  });

  final ApiService apiService;

  final IHomeRepository homeRepository;
}
