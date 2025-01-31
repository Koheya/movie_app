import 'package:movies_clean_architecture/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    required super.id,
    super.backdropPath,
  });
  RecommendationModel copyWith({
    int? id,
    String? backdropPath,
  }) {
    return RecommendationModel(
      id: id ?? this.id,
      backdropPath: backdropPath ?? this.backdropPath,
    );
  }

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      id: json["id"],
      backdropPath: json["backdrop_path"] ?? '/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg',
    );
  }
}
