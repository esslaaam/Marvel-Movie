import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/functions/setup_locator.dart';
import '../cubit/movies_cubit.dart';
import 'widget/custom_list_result_search.dart';
import 'widget/custom_movie_list.dart';
import 'widget/custom_search_form_field.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => getIt<MoviesCubit>()..fetchMovies()..pageInitMovies()..pageInitSearchMovies(),
        child: BlocBuilder<MoviesCubit, MoviesState>(
          builder: (context, state) {
            final cubit = BlocProvider.of<MoviesCubit>(context);
            return SafeArea(
              child: Column(
                children: [
                  CustomSearchFormField(
                    controller: cubit.searchCtrl,
                    onSearchChanged: (val) {
                      cubit.search(val: val);
                    },
                  ),
                  cubit.isSearch == true
                      ? CustomMovieResultSearchList(
                          cubit: cubit,
                          state: state,
                        )
                      : CustomMovieList(
                          cubit: cubit,
                          state: state,
                        )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
