import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/functions/setup_locator.dart';
import 'package:movie_app/features/movie_details/presentation/cubit/movie_details_cubit.dart';

import 'custom_details.dart';

class MovieDetailsViewBody extends StatelessWidget {
  final int id;

  const MovieDetailsViewBody({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MovieDetailsCubit>()..fetchMovieDetails(id: id),
      child: CustomDetails(id: id),
    );
  }
}
