import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/features/movies/presentation/views/widget/custom_movie_item_loading.dart';

class CustomMovieListLoading extends StatelessWidget {
  const CustomMovieListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          padding: EdgeInsetsDirectional.only(
              start: width(context) * 0.04,
              bottom: height(context) * 0.02,
              end: width(context) * 0.04),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => const CustomMovieItemLoading(),
          separatorBuilder: (context, index) =>
              SizedBox(height: height(context) * 0.02),
          itemCount: 6),
    );
  }
}
