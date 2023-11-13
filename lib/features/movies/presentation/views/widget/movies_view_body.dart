import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/functions/setup_locator.dart';
import 'package:movie_app/features/movies/data/models/search_model.dart';
import 'package:movie_app/features/movies/data/repos/movies_repos_impl.dart';
import 'package:movie_app/features/movies/domain/use_cases/fetch_movies_use_case.dart';
import 'package:movie_app/features/movies/domain/use_cases/fetch_result_search_movies.dart';
import 'package:movie_app/features/movies/presentation/cubit/movies_cubit.dart';
import 'package:movie_app/features/movies/presentation/views/widget/custom_list_result_search.dart';
import 'package:movie_app/features/movies/presentation/views/widget/custom_movie_list.dart';
import 'custom_search_form_field.dart';

class MoviesViewBody extends StatelessWidget {
  const MoviesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MoviesCubit(
          FetchMoviesUseCase(getIt.get<MoviesReposImpl>()),
          FetchResultSearchMoviesUseCase(getIt.get<MoviesReposImpl>()))
        ..fetchMovies()
        ..pageInitMovies()
        ..pageInitSearchMovies(),
      child: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<MoviesCubit>(context);
          return SafeArea(
            child: Column(
              children: [
                CustomSearchFormField(
                    controller: cubit.searchCtrl,
                    onSearchChanged: (val) {
                      if (val.isNotEmpty) {
                        cubit.playSearch();
                        cubit.fetchResultSearchMovies(
                            searchModel: SearchModel(0, val));
                      } else {
                        cubit.stopSearch();
                      }
                    }),
                cubit.isSearch == true
                    ? const CustomMovieResultSearchList()
                    : const CustomMovieList()
              ],
            ),
          );
        },
      ),
    );
  }
}
