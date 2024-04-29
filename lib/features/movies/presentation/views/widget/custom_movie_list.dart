import 'package:flutter/material.dart';
import 'package:movie_app/core/widget/custom_error.dart';
import 'package:movie_app/features/movies/presentation/cubit/movies_cubit.dart';

import 'custom_movie_list_loading.dart';
import 'list_movies.dart';
import 'movies_empty.dart';

class CustomMovieList extends StatelessWidget {
  final MoviesCubit cubit;

  final MoviesState state;

  const CustomMovieList({super.key, required this.cubit, required this.state});

  @override
  Widget build(BuildContext context) {
    return state is MoviesLoading
        ? const CustomMovieListLoading()
        : state is MoviesFailure
            ? CustomError(
                errMsg: (state as MoviesFailure).errMsg,
                onPressed: () {
                  cubit.fetchMovies();
                })
            : state is MoviesPaginationFailure
                ? CustomError(
                    errMsg: (state as MoviesPaginationFailure) .errMsg,
                    onPressed: () {
                      cubit.fetchMovies(pageNumber: cubit.nextPage - 1);
                    })
                : cubit.homeMovies.isEmpty
                    ? const MoviesEmpty(text: "There are no movies")
                    : ListMovies(
      key: const Key("list_movies_home"),
                        controller: cubit.scrollControllerMovies,
                        movies: cubit.homeMovies);
  }
}
