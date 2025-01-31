import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_architecture/core/services/service_locator.dart';
import 'package:movies_clean_architecture/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_clean_architecture/movies/presentation/controller/movies_event.dart';
import 'package:movies_clean_architecture/movies/presentation/screens/see_all_popular.dart';
import 'package:movies_clean_architecture/movies/presentation/widgets/category_header_widget.dart';
import 'package:movies_clean_architecture/movies/presentation/widgets/now_playing_widget.dart';
import 'package:movies_clean_architecture/movies/presentation/widgets/popular_widget.dart';
import 'package:movies_clean_architecture/movies/presentation/widgets/top_rated_widget.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: Scaffold(
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingWidget(),
              CategoryHeaderWidget(
                title: "Popular",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SeeAllPopular()));
                },
              ),
              const PopularWidget(),
              CategoryHeaderWidget(
                title: "Top Rated",
                onTap: () {},
              ),
              const TopRatedWidget(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
