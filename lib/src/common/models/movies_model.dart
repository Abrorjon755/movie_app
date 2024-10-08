class MovieModel {
  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;
  final bool isSelected;

  MovieModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    this.isSelected = false,
  });

  factory MovieModel.fromJson(Map<String, Object?> json) => MovieModel(
        adult: json['adult'] as bool,
        backdropPath: json['backdrop_path'] as String?,
        genreIds:
            (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
        id: json['id'] as int,
        originalLanguage: json['original_language'] as String,
        originalTitle: json['original_title'] as String,
        overview: json['overview'] as String,
        popularity: (json['popularity'] as num).toDouble(),
        posterPath: json['poster_path'] as String?,
        releaseDate: json['release_date'] as String,
        title: json['title'] as String,
        video: json['video'] as bool,
        voteAverage: (json['vote_average'] as num).toDouble(),
        voteCount: json['vote_count'] as int,
      );

  Map<String, Object?> toJson() => {
        'adult': adult,
        'backdrop_path': backdropPath,
        'genre_ids': genreIds,
        'id': id,
        'original_language': originalLanguage,
        'original_title': originalTitle,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'release_date': releaseDate,
        'title': title,
        'video': video,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };

  factory MovieModel.fromMap(Map<String, Object?> json) => MovieModel(
        adult: (json['adult'] as int?)! == 0 ? false : true,
        backdropPath: (json['backdropPath'] as String?),
        genreIds: json['genreIds'] != null
            ? (json['genreIds'] as String?)!
                .split(',')
                .map((e) => int.tryParse(e) ?? 0)
                .toList()
            : [],
        id: (json['id'] as int?)!,
        originalLanguage: (json['originalLanguage'] as String?)!,
        originalTitle: (json['originalTitle'] as String?)!,
        overview: (json['overview'] as String?)!,
        popularity: (json['popularity'] as double?)!,
        posterPath: (json['posterPath'] as String?),
        releaseDate: (json['releaseDate'] as String?)!,
        title: (json['title'] as String?)!,
        video: (json['video'] as int?)! == 0 ? false : true,
        voteAverage: double.parse((json['voteAverage'] as num?)!.toString()),
        voteCount: (json['voteCount'] as int?)!,
        isSelected: (json['isSelected'] as int?)! == 0 ? false : true,
      );

  Map<String, Object?> toMap() => {
        'id': id,
        'adult': adult ? 1 : 0,
        'backdropPath': backdropPath,
        'genreIds': genreIds.join(','),
        'originalLanguage': originalLanguage,
        'originalTitle': originalTitle,
        'overview': overview,
        'popularity': popularity,
        'posterPath': posterPath,
        'releaseDate': releaseDate,
        'title': title,
        'video': video ? 1 : 0,
        'voteAverage': voteAverage,
        'voteCount': voteCount,
        'isSelected': isSelected ? 1 : 0,
      };

  MovieModel copyWith({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
    bool? isSelected,
  }) =>
      MovieModel(
        adult: adult ?? this.adult,
        backdropPath: backdropPath ?? this.backdropPath,
        genreIds: genreIds ?? this.genreIds,
        id: id ?? this.id,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        originalTitle: originalTitle ?? this.originalTitle,
        overview: overview ?? this.overview,
        popularity: popularity ?? this.popularity,
        posterPath: posterPath ?? this.posterPath,
        releaseDate: releaseDate ?? this.releaseDate,
        title: title ?? this.title,
        video: video ?? this.video,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
        isSelected: isSelected ?? this.isSelected,
      );
}
