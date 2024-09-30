class Actor {
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final int castId;
  final String character;
  final String creditId;
  final int order;

  Actor({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
  });

  factory Actor.fromMap(Map<String, dynamic> map) {
    return Actor(
      adult: map['adult'] as bool,
      gender: map['gender'] as int,
      id: map['id'] as int,
      knownForDepartment: map['known_for_department'] as String,
      name: map['name'] as String,
      originalName: map['original_name'] as String,
      popularity: map['popularity'] as double,
      profilePath: map['profile_path'] as String?,
      castId: map['cast_id'] as int,
      character: map['character'] as String,
      creditId: map['credit_id'] as String,
      order: map['order'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'adult': adult,
      'gender': gender,
      'id': id,
      'known_for_department': knownForDepartment,
      'name': name,
      'original_name': originalName,
      'popularity': popularity,
      'profile_path': profilePath,
      'cast_id': castId,
      'character': character,
      'credit_id': creditId,
      'order': order,
    };
  }
}
