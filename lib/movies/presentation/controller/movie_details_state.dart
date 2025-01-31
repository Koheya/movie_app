import 'package:equatable/equatable.dart';
import 'package:movies_clean_architecture/core/utils/enums.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movies_detail.dart';
import 'package:movies_clean_architecture/movies/domain/entities/recommendation.dart';

class MovieDetailsState extends Equatable {
  final RequestState movieDetailsState;
  final MoviesDetial? movieDetails;
  final String movieDetailsMessage;

  final RequestState movieRecommendationsState;
  final List<Recommendation> movieRecommendations;
  final String movieRecommendationsMessage;
  
  const MovieDetailsState({
    this.movieDetailsState = RequestState.loading,
    this.movieDetails,
    this.movieDetailsMessage = "",
    this.movieRecommendationsState = RequestState.loading,
    this.movieRecommendations = const [],
    this.movieRecommendationsMessage = "",
  });
  MovieDetailsState copyWith({
    RequestState? movieDetailsState,
    MoviesDetial? movieDetails,
    String? movieDetailsMessage,
    RequestState? movieRecommendationsState,
    List<Recommendation>? movieRecommendations,
    String? movieRecommendationsMessage,
  }) {
    return MovieDetailsState(
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieRecommendationsState:
          movieRecommendationsState ?? this.movieRecommendationsState,
      movieRecommendations: movieRecommendations ?? this.movieRecommendations,
      movieRecommendationsMessage:
          movieRecommendationsMessage ?? this.movieRecommendationsMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetailsState,
        movieDetails,
        movieDetailsMessage,
        movieRecommendationsState,
        movieRecommendations,
        movieRecommendationsMessage
      ];
}
