// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movies_clean_architecture/core/error/failure.dart';
import 'package:movies_clean_architecture/core/usecase/base_use_case.dart';
import 'package:movies_clean_architecture/movies/domain/entities/recommendation.dart';
import 'package:movies_clean_architecture/movies/domain/repositories/base_movies_repository.dart';

class GetRecommendationUseCase
    extends BaseuseCase<List<Recommendation>, RecommendationParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParameters parameters) async {
    return await baseMoviesRepository.getRecommendation(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int id;
  const RecommendationParameters({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
