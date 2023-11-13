import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/colors.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/core/utils/my_navigate.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/features/movie_details/presentation/views/movie_details_view.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';

import 'custom_image.dart';

class CustomMovieItem extends StatelessWidget {
  final MovieEntity movie;

  const CustomMovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(context: context, widget: MovieDetailsView(id: movie.filmId));
      },
      borderRadius: BorderRadius.circular(AppRadius.r15),
      child: SizedBox(
        height: height(context) * 0.14,
        child: Row(
          children: [
            CustomImage(imageUrl: movie.image.toString()),
            SizedBox(width: width(context) * 0.025),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width(context) * 0.59,
                    child: Text(
                      movie.movieName.toString(),
                      style: Styles.textStyle18,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(height: height(context) * 0.005),
                  SizedBox(
                      width: width(context) * 0.59,
                      child: Text(
                        movie.desc == ""
                            ? "There is no description"
                            : movie.desc.toString(),
                        maxLines: 2,
                        style: Styles.textStyle14
                            .copyWith(color: AppColors.kWhite),
                      )),
                  SizedBox(height: height(context) * 0.015),
                  Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(movie.date.toString(),
                          style: Styles.textStyle11)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
