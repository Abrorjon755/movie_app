import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../constants/constants.dart';
import '../models/movies_model.dart';

late final Database $database;

class DBService {
  static Future<DBService> initialize() async {
    $database = await openDatabase(
      join(await getDatabasesPath(), 'movie.db'),
      onCreate: (db, version) async {
        return await db.execute('''
    CREATE TABLE ${Constants.movieTableName} (
      id INTEGER PRIMARY KEY,
      adult INTEGER NOT NULL,
      backdropPath TEXT,
      genreIds TEXT NOT NULL,
      originalLanguage TEXT NOT NULL,
      originalTitle TEXT NOT NULL,
      overview TEXT NOT NULL,
      popularity REAL NOT NULL,
      posterPath TEXT,
      releaseDate TEXT NOT NULL,
      title TEXT NOT NULL,
      video INTEGER NOT NULL,
      voteAverage REAL NOT NULL,
      voteCount INTEGER NOT NULL,
      isSelected INTEGER NOT NULL
    );
  ''');
      },
      version: 1,
    );

    return DBService();
  }

  Future<void> insert(Map<String, Object?> movie) =>
      $database.insert(Constants.movieTableName, movie);

  Future<List<MovieModel>> getMovies() async => (await $database.query(
        Constants.movieTableName,
      ))
          .map(MovieModel.fromMap)
          .toList();

  Future<void> delete(int id) => $database.delete(
        Constants.movieTableName,
        where: 'id = ?',
        whereArgs: [id],
      );

  Future<MovieModel?> getMovie(int id) async => (await $database.query(
        Constants.movieTableName,
        where: 'id = ? ',
        whereArgs: [id],
      ))
          .map(MovieModel.fromMap)
          .firstOrNull;
}
