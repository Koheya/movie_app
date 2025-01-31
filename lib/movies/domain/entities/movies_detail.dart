import 'package:equatable/equatable.dart';

import 'genres.dart';

class MoviesDetial extends Equatable {
  final int id;
  final String title;
  final String overview;
  final int runtime;
  final List<Genres> genres;
  final String backdropPath;
  final double voteAverage;
  final String releaseDate;
  const MoviesDetial({
    required this.id,
    required this.title,
    required this.overview,
    required this.runtime,
    required this.genres,
    required this.backdropPath,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        runtime,
        genres,
        backdropPath,
        voteAverage,
        releaseDate
      ];
}
