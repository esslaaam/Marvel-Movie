import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/widget/custom_error.dart';
import 'package:movie_app/features/movies/presentation/cubit/movies_cubit.dart';
import 'custom_movie_list_loading.dart';
import 'list_movies.dart';
import 'movies_empty.dart';

class CustomMovieList extends StatelessWidget {
  const CustomMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<MoviesCubit>(context);
        return state is MoviesLoadingState
            ? const CustomMovieListLoading()
            : state is MoviesFailureState
                ? CustomError(errMsg: state.errMsg, onPressed: () {cubit.fetchMovies();})
                : cubit.homeMovies.isEmpty
                    ? const MoviesEmpty(text: "There are no movies")
                    : ListMovies(controller: cubit.scrollControllerMovies, movies:cubit.homeMovies);
      },
    );
  }
}
