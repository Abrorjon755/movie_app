class Constants {
  const Constants._();

  static const String getTheme = "theme";
  static const String getLocale = "locale";

  static const String movieTableName = "Movie";

  static const String baseUrl = "https://api.themoviedb.org";
  static const String imageUrl = "https://image.tmdb.org/t/p/w500";
  static const String imageUrlOriginal = "https://image.tmdb.org/t/p/original";

  static const String genre = '/3/genre/movie/list';

  static const String pathMovies = "/3/discover/movie";
  static const String pathNowPlaying = "/3/movie/now_playing";
  static const String pathPopular = "/3/movie/popular";
  static const String pathTopRated = "/3/movie/top_rated";
  static const String pathUpcoming = "/3/movie/upcoming";
  static const String pathSearch = "/3/search/movie";
  static const String pathSingleMovie = "/3/movie";

  static const String apiKeyString = "api_key=c0b6525896f89213f42e9aa279d0570e";
  static const Map<String, Object?> apiKey ={
    "api_key": "c0b6525896f89213f42e9aa279d0570e",
  };
}
