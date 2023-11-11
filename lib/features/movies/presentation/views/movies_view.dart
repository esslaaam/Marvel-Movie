import 'package:flutter/material.dart';
import 'package:movie_app/features/movies/presentation/views/widget/movies_view_body.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MoviesViewBody(),
    );
  }
}
