import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_architecture/core/network/api_constants.dart';
import 'package:movies_clean_architecture/core/services/service_locator.dart';
import 'package:movies_clean_architecture/core/utils/enums.dart';
import 'package:movies_clean_architecture/movies/domain/entities/genres.dart';
import 'package:movies_clean_architecture/movies/presentation/controller/movie_details_bloc.dart';
import 'package:movies_clean_architecture/movies/presentation/controller/movie_details_state.dart';

import 'package:movies_clean_architecture/movies/presentation/widgets/title_text_widget.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MovieDetailsBloc>()
        ..add(GetMovieDetailsEvent(id))
        ..add(GetMovieRecommendationEvent(id)),
      lazy: false,
      child: const Scaffold(
        body: MovieDetailContent(),
      ),
    );
  }
}

class MovieDetailContent extends StatelessWidget {
  const MovieDetailContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      buildWhen: (previous, current) =>
          previous.movieDetailsState != current.movieDetailsState,
      builder: (context, state) {
        switch (state.movieDetailsState) {
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case RequestState.loaded:
            return CustomScrollView(
              // Use CustomScrollView for sliver content
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 250.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: CachedNetworkImage(
                      imageUrl: ApiConstants.imageUrl(
                          state.movieDetails!.backdropPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  // Non-sliver widgets wrapped inside SliverToBoxAdapter
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleTextWidget(title: state.movieDetails!.title),
                        const SizedBox(height: 8.0),
                        _buildMovieInfo(state),
                        const SizedBox(height: 20.0),
                        Text(
                          state.movieDetails!.overview,
                          style: const TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Genres: ${_showGenres(state.movieDetails!.genres)}',
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                ),
                const SliverPadding(
                  padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                  sliver: SliverToBoxAdapter(
                    child: TitleTextWidget(title: 'More like this'),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
                  sliver:
                      _showRecommendations(), // Show recommendations as a sliver
                ),
              ],
            );
          case RequestState.error:
            return Center(child: Text(state.movieDetailsMessage));
        }
      },
    );
  }

  Widget _buildMovieInfo(MovieDetailsState state) {
    return Row(
      children: [
        buildReleaseDate(state.movieDetails!.releaseDate),
        const SizedBox(width: 16.0),
        _buildRating(state.movieDetails!.voteAverage),
        const SizedBox(width: 16.0),
        _buildRuntime(state.movieDetails!.runtime),
      ],
    );
  }

  Widget buildReleaseDate(String releaseDate) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
      decoration: BoxDecoration(
          color: Colors.grey[800], borderRadius: BorderRadius.circular(4.0)),
      child: Text(
        releaseDate.split('-')[0],
        style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildRating(double voteAverage) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 20.0),
        const SizedBox(width: 4.0),
        Text(
          (voteAverage / 2).toStringAsFixed(1),
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        const SizedBox(width: 4.0),
        Text(
          '($voteAverage)',
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildRuntime(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;
    return Text(
      hours > 0 ? '${hours}h ${minutes}m' : '${minutes}m',
      style: const TextStyle(color: Colors.white70, fontSize: 16.0),
    );
  }

  String _showGenres(List<Genres> genres) {
    return genres.map((genre) => genre.name).join(', ');
  }

  Widget _showRecommendations() {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        switch (state.movieRecommendationsState) {
          case RequestState.loading:
            return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          case RequestState.loaded:
            return SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.7,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final recommendation = state.movieRecommendations[index];
                  return CachedNetworkImage(
                    imageUrl:
                        ApiConstants.imageUrl(recommendation.backdropPath!),
                    fit: BoxFit.cover,
                  );
                },
                childCount: state.movieRecommendations.length,
              ),
            );
          case RequestState.error:
            return SliverToBoxAdapter(
              child: Center(
                child: Text(state.movieDetailsMessage),
              ),
            );
        }
      },
    );
  }
}
