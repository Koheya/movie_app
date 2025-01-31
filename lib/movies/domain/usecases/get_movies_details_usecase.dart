import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_clean_architecture/core/error/failure.dart';
import 'package:movies_clean_architecture/core/usecase/base_use_case.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movies_detail.dart';
import 'package:movies_clean_architecture/movies/domain/repositories/base_movies_repository.dart';

class GetMoviesDetailUseCase
    extends BaseuseCase<MoviesDetial, MoviesDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMoviesDetailUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, MoviesDetial>> call(
      MoviesDetailsParameters parameters) async {
    return await baseMoviesRepository.getMovieDetails(parameters);
  }
}

class MoviesDetailsParameters extends Equatable {
  final int movieId;
  const MoviesDetailsParameters({required this.movieId});
  @override
  List<Object> get props => [
        movieId,
      ];
}
