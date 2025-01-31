import 'package:movies_clean_architecture/movies/data/models/genres_model.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movies_detail.dart';

class MovieDetailsModel extends MoviesDetial {
  const MovieDetailsModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.runtime,
    required super.genres,
    required super.backdropPath,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      runtime: json['runtime'],
      genres: List<GenresModel>.from(
          json['genres'].map((x) => GenresModel.fromJson(x))),
      backdropPath: json['backdrop_path'],
      voteAverage: json['vote_average'].toDouble(),
      releaseDate: json['release_date'],
    );
  }
}
