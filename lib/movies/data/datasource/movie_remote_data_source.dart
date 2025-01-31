import 'package:dio/dio.dart';
import 'package:movies_clean_architecture/core/error/exception.dart';
import 'package:movies_clean_architecture/core/network/api_constants.dart';
import 'package:movies_clean_architecture/core/network/error_message_model.dart';
import 'package:movies_clean_architecture/movies/data/models/movie_details_model.dart';
import 'package:movies_clean_architecture/movies/data/models/movie_model.dart';
import 'package:movies_clean_architecture/movies/data/models/recommendation_model.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_movies_details_usecase.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_recommendations_usecase.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlatingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  // Get Movie Details
  Future<MovieDetailsModel> getMovieDetails(MoviesDetailsParameters parameters);

  // Get Recommendation Movies
  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  // Get Now Playing Movies
  @override
  Future<List<MovieModel>> getNowPlatingMovies() async {
    final response = await Dio().get(ApiConstants.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  // Get Popular Movies
  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstants.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  // Get Top Rated Movies
  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstants.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MoviesDetailsParameters parameters) async {
    final response =
        await Dio().get(ApiConstants.moviesDetailsPath(parameters.movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameters) async {
    final response =
        await Dio().get(ApiConstants.recommendationsMoviesPath(parameters.id));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data["results"] as List)
          .map((e) => RecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
