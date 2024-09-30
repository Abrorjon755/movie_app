class Movie {
  bool adult;
  String? backdropPath;
  Collection? belongsToCollection;
  int budget;
  List<MovieGenre> genres;
  String homepage;
  int id;
  String imdbId;
  List<String> originCountry;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String? posterPath;
  List<ProductionCompany> productionCompanies;
  List<ProductionCountry> productionCountries;
  String releaseDate;
  int revenue;
  int runtime;
  List<SpokenLanguage> spokenLanguages;
  String status;
  String tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  Movie({
    required this.adult,
    required this.backdropPath,
    this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      adult: json['adult'] as bool,
      backdropPath: json['backdrop_path'] as String?,
      belongsToCollection: json['belongs_to_collection'] != null
          ? Collection.fromJson(json['belongs_to_collection'])
          : null,
      budget: json['budget'] as int,
      genres: (json['genres'] as List)
          .map((genre) => MovieGenre.fromJson(genre))
          .toList(),
      homepage: json['homepage'] as String,
      id: json['id'] as int,
      imdbId: json['imdb_id'] as String,
      originCountry:
          (json['origin_country'] as List).map((e) => e as String).toList(),
      originalLanguage: json['original_language'] as String,
      originalTitle: json['original_title'] as String,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['poster_path'] as String?,
      productionCompanies: (json['production_companies'] as List)
          .map((company) => ProductionCompany.fromJson(company))
          .toList(),
      productionCountries: (json['production_countries'] as List)
          .map((country) => ProductionCountry.fromJson(country))
          .toList(),
      releaseDate: json['release_date'] as String,
      revenue: json['revenue'] as int,
      runtime: json['runtime'] as int,
      spokenLanguages: (json['spoken_languages'] as List)
          .map((language) => SpokenLanguage.fromJson(language))
          .toList(),
      status: json['status'] as String,
      tagline: json['tagline'] as String,
      title: json['title'] as String,
      video: json['video'] as bool,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
    );
  }
}

class Collection {
  int id;
  String name;
  String posterPath;
  String backdropPath;

  Collection({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
  });

  factory Collection.fromJson(Map<String, dynamic> json) {
    return Collection(
      id: json['id'] as int,
      name: json['name'] as String,
      posterPath: json['poster_path'] as String,
      backdropPath: json['backdrop_path'] as String,
    );
  }
}

class MovieGenre {
  int id;
  String name;

  MovieGenre({required this.id, required this.name});

  factory MovieGenre.fromJson(Map<String, dynamic> json) {
    return MovieGenre(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
}

class ProductionCompany {
  int id;
  String? logoPath;
  String name;
  String originCountry;

  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
      id: json['id'] as int,
      logoPath: json['logo_path'] as String?,
      name: json['name'] as String,
      originCountry: json['origin_country'] as String,
    );
  }
}

class ProductionCountry {
  String iso3166_1;
  String name;

  ProductionCountry({required this.iso3166_1, required this.name});

  factory ProductionCountry.fromJson(Map<String, dynamic> json) {
    return ProductionCountry(
      iso3166_1: json['iso_3166_1'] as String,
      name: json['name'] as String,
    );
  }
}

class SpokenLanguage {
  String englishName;
  String iso639_1;
  String name;

  SpokenLanguage({
    required this.englishName,
    required this.iso639_1,
    required this.name,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) {
    return SpokenLanguage(
      englishName: json['english_name'] as String,
      iso639_1: json['iso_639_1'] as String,
      name: json['name'] as String,
    );
  }
}
