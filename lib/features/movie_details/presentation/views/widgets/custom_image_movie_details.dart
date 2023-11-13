import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/features/movies/presentation/views/widget/custom_image.dart';

class CustomImageMovieDetails extends StatelessWidget {
  final String imageUrl ;
  const CustomImageMovieDetails({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: width(context) * 0.22,
          end: width(context) * 0.22,
          top: height(context) * 0.03),
      child: CustomImage(imageUrl:imageUrl),
    );
  }
}
