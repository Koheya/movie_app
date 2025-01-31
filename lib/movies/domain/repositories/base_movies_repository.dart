import 'package:dartz/dartz.dart';
import 'package:movies_clean_architecture/core/error/failure.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movie.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movies_detail.dart';
import 'package:movies_clean_architecture/movies/domain/entities/recommendation.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_movies_details_usecase.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_recommendations_usecase.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MoviesDetial>> getMovieDetails(
      MoviesDetailsParameters parameters);

  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters);
}
