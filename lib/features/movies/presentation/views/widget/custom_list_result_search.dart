import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/widget/custom_error.dart';
import 'package:movie_app/features/movies/data/models/search_model.dart';
import 'package:movie_app/features/movies/presentation/cubit/movies_cubit.dart';
import 'custom_movie_list_loading.dart';
import 'list_movies.dart';
import 'movies_empty.dart';

class CustomMovieResultSearchList extends StatelessWidget {
  const CustomMovieResultSearchList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<MoviesCubit>(context);
        return state is MoviesSearchLoading || state is MoviesSearchDelayLoading
            ? const CustomMovieListLoading()
            : state is MoviesSearchFailure
                ? CustomError(
                    errMsg: state.errMsg,
                    onPressed: () {
                      cubit.fetchResultSearchMovies(
                          searchModel: SearchModel(0, cubit.searchCtrl.text));
                    })
                : state is MoviesSearchPaginationFailure
                    ? CustomError(
                        errMsg: state.errMsg,
                        onPressed: () {
                          cubit.fetchResultSearchMovies(searchModel: SearchModel(cubit.nextPageSearch - 1, cubit.searchCtrl.text));
                        })
                    : cubit.resultSearchMovies.isEmpty
                        ? const MoviesEmpty(
                            text: "There are no search results for movies")
                        : ListMovies(
                            controller: cubit.scrollControllerSearchMovies,
                            movies: cubit.resultSearchMovies);
      },
    );
  }
}
