import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_architecture/core/services/service_locator.dart';
import 'package:movies_clean_architecture/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_clean_architecture/movies/presentation/controller/movies_event.dart';
import 'package:movies_clean_architecture/movies/presentation/controller/movies_state.dart';

import 'package:movies_clean_architecture/movies/presentation/widgets/title_text_widget.dart';

class SeeAllPopular extends StatelessWidget {
  const SeeAllPopular({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()..add(GetPopularMoviesEvent()),
      child: Scaffold(
        body: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: state.popularMovies.length,
              itemBuilder: (context, index) {
                final movie = state.popularMovies[index];
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          TitleTextWidget(title: movie.title),
                          const SizedBox(height: 8.0),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(4.0)),
                            child: Text(movie.releaseDate.split("-")[0]),
                          ),
                          const SizedBox(height: 8.0),
                          Text(movie.overview)
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
