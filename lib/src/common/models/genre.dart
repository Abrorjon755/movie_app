class Genre {
  final int id;
  final String name;

  const Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json['id'] as int,
        name: json['name'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

extension ListIntX on List<Genre> {
  String genresToString(List<int> ids) {
    const int maxGenresToShow = 3;
    final List<String> genreNames = where((genre) => ids.contains(genre.id))
        .map((genre) => genre.name)
        .take(maxGenresToShow)
        .toList();
    return genreNames.join(', ');
  }
}
