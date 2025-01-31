import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_architecture/core/utils/enums.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_movies_details_usecase.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_recommendations_usecase.dart';
import 'package:movies_clean_architecture/movies/presentation/controller/movie_details_state.dart';

part 'movie_details_event.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMoviesDetailUseCase getMoviesDetailUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;
  MovieDetailsBloc(this.getMoviesDetailUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    // Get Movie Details
    on<GetMovieDetailsEvent>(_getMovieDetails);
    // Get Movie Recommendations
    on<GetMovieRecommendationEvent>(_getMovieRecommendations);
  }

  Future<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMoviesDetailUseCase(
        MoviesDetailsParameters(movieId: event.id));
    result.fold(
      (l) => emit(
        state.copyWith(
          movieDetailsState: RequestState.error,
          movieDetailsMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieDetails: r,
          movieDetailsState: RequestState.loaded,
        ),
      ),
    );
  }

  // Get Movie Recommendations
  Future<void> _getMovieRecommendations(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result =
        await getRecommendationUseCase(RecommendationParameters(id: event.id));
    result.fold(
      (l) => emit(
        state.copyWith(
          movieRecommendationsState: RequestState.error,
          movieRecommendationsMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieRecommendations: r,
          movieRecommendationsState: RequestState.loaded,
        ),
      ),
    );
  }
}
