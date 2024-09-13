class Constants {
  const Constants._();

  static const String getTheme = "theme";
  static const String getLocale = "locale";

  static const String baseUrl = "https://api.themoviedb.org";

  static const String pathAuthenticate = "/authenticate/{REQUEST_TOKEN}";
  static const String pathMovies = "/3/discover/movie";
  static const String pathSearch = "/3/search/movie";
  static const String pathSingleMovie = "/3/movie";

  static const Map<String, Object?> apiKey = {
    "api_key": "c0b6525896f89213f42e9aa279d0570e",
  };
}
