import 'package:equatable/equatable.dart';

import 'package:movies_clean_architecture/core/utils/enums.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingMoviesState;
  final String nowPlayingMessage;

  final List<Movie> popularMovies;
  final RequestState popularMoviesState;
  final String popularMessage;

  final List<Movie> topRatedMovies;
  final RequestState topRatedMoviesState;
  final String topRatedMessage;
  const MoviesState({
    this.popularMovies = const [],
    this.popularMoviesState = RequestState.loading,
    this.popularMessage = "",
    this.topRatedMovies = const [],
    this.topRatedMoviesState = RequestState.loading,
    this.topRatedMessage = "",
    this.nowPlayingMovies = const [],
    this.nowPlayingMoviesState = RequestState.loading,
    this.nowPlayingMessage = "",
  });

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingMoviesState,
    String? nowPlayingMessage,
    List<Movie>? popularMovies,
    RequestState? popularMoviesState,
    String? popularMessage,
    List<Movie>? topRatedMovies,
    RequestState? topRatedMoviesState,
    String? topRatedMessage,
  }) {
    return MoviesState(
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingMoviesState:
          nowPlayingMoviesState ?? this.nowPlayingMoviesState,
      popularMessage: popularMessage ?? this.popularMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMoviesState: popularMoviesState ?? this.popularMoviesState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMoviesState: topRatedMoviesState ?? this.topRatedMoviesState,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingMoviesState,
        nowPlayingMessage,
        popularMovies,
        popularMoviesState,
        popularMessage,
        topRatedMovies,
        topRatedMoviesState,
        topRatedMessage
      ];
}
