import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/colors.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/core/utils/images.dart';

class CustomImage extends StatelessWidget {
  final String imageUrl ;
  const CustomImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio:2.75 / 4,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.r15),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => Image.asset(AppImages.imageNotFound),
            placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(color: AppColors.kWhite)),
          )),
    );
  }
}
