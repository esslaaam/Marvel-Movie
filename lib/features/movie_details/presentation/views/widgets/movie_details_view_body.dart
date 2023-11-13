import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/functions/setup_locator.dart';
import 'package:movie_app/features/movie_details/data/repos/movie_details_repos_impl.dart';
import 'package:movie_app/features/movie_details/domain/use_cases/fetch_movie_details_use_case.dart';
import 'package:movie_app/features/movie_details/presentation/cubit/movie_details_cubit.dart';
import 'custom_details.dart';

class MovieDetailsViewBody extends StatelessWidget {
  final int id;
  const MovieDetailsViewBody({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MovieDetailsCubit(
          FetchMovieDetailsUseCase(getIt.get<MovieDetailsReposImpl>()))
        ..fetchMovieDetails(id: id),
      child: CustomDetails(id: id),
    );
  }
}
