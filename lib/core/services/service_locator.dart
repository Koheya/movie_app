import 'package:get_it/get_it.dart';
import 'package:movies_clean_architecture/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_clean_architecture/movies/data/repositories/movies_repository.dart';
import 'package:movies_clean_architecture/movies/domain/repositories/base_movies_repository.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_movies_details_usecase.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_recommendations_usecase.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies_clean_architecture/movies/presentation/controller/movie_details_bloc.dart';
import 'package:movies_clean_architecture/movies/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    // BLoC
    sl.registerFactory<MoviesBloc>(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory<MovieDetailsBloc>(() => MovieDetailsBloc(sl(), sl()));

    // Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());

    // Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(baseMovieRemoteDataSource: sl()));

    // Use Case
    sl.registerLazySingleton(() => GetNowPlayingMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetMoviesDetailUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));
  }
}
