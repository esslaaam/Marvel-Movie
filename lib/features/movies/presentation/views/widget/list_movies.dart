import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/core/widget/fade_animation.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';

import 'custom_movie_item.dart';

class ListMovies extends StatelessWidget {
  final ScrollController controller;

  final List<MovieEntity> movies;

  const ListMovies({super.key, required this.controller, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FadeAnimation(
        0.5,
        1,
        ListView.separated(
            padding: EdgeInsetsDirectional.only(
                start: width(context) * 0.04,
                bottom: height(context) * 0.02,
                end: width(context) * 0.04),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            controller: controller,
            itemBuilder: (context, index) =>
                CustomMovieItem(movie: movies[index]),
            separatorBuilder: (context, index) =>
                SizedBox(height: height(context) * 0.02),
            itemCount: movies.length),
      ),
    );
  }
}
