import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_architecture/core/usecase/base_use_case.dart';
import 'package:movies_clean_architecture/core/utils/enums.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies_clean_architecture/movies/presentation/controller/movies_event.dart';
import 'package:movies_clean_architecture/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;
  MoviesBloc(this.getNowPlayingMoviesUsecase, this.getPopularMoviesUsecase,
      this.getTopRatedMoviesUsecase)
      : super(const MoviesState()) {
    // now playing
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    // popular
    on<GetPopularMoviesEvent>(_getPopularMovies);
    // top rated
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  Future<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUsecase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          popularMoviesState: RequestState.error,
          popularMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
            popularMoviesState: RequestState.loaded, popularMovies: r),
      ),
    );
  }

  Future<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUsecase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          topRatedMoviesState: RequestState.error,
          topRatedMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          topRatedMoviesState: RequestState.loaded,
          topRatedMovies: r,
        ),
      ),
    );
  }

  Future<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUsecase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          nowPlayingMoviesState: RequestState.error,
          nowPlayingMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          nowPlayingMoviesState: RequestState.loaded,
          nowPlayingMovies: r,
        ),
      ),
    );
  }
}
