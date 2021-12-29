import 'dart:convert';

import 'package:movie_app_test/features/movie/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    String? posterPath,
    required bool adult,
    required String overview,
    required DateTime releaseDate,
    required List<int> genreIds,
    required int id,
    required String originalTitle,
    required String originalLanguage,
    required String title,
    String? backdropPath,
    required double popularity,
    required int voteCount,
    required bool video,
    required int voteAverage,
  }) : super(
          adult: adult,
          overview: overview,
          releaseDate: releaseDate,
          genreIds: genreIds,
          id: id,
          originalTitle: originalTitle,
          originalLanguage: originalLanguage,
          title: title,
          backdropPath: backdropPath,
          popularity: popularity,
          voteCount: voteCount,
          video: video,
          voteAverage: voteAverage,
        );



  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      posterPath: map['poster_path'],
      adult: map['adult'] ?? false,
      overview: map['overview'] ?? '',
      releaseDate: DateTime.parse(map['release_date']),
      genreIds: List<int>.from(map['genreIds']),
      id: map['id']?.toInt() ?? 0,
      originalTitle: map['original_title'] ?? '',
      originalLanguage: map['original_language'] ?? '',
      title: map['title'] ?? '',
      backdropPath: map['backdrop_path'],
      popularity: map['popularity']?.toDouble() ?? 0.0,
      voteCount: map['vote_count']?.toInt() ?? 0,
      video: map['video'] ?? false,
      voteAverage: map['vote_average']?.toInt() ?? 0,
    );
  }



  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));
}
