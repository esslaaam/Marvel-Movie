import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/core/widget/custom_fading_loading.dart';

class CustomMovieItemLoading extends StatelessWidget {
  const CustomMovieItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFading(
      child: SizedBox(
        height: height(context) * 0.14,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 4 / 5,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppRadius.r15),
                  child: Container(
                    color: Colors.grey,
                  )),
            ),
            SizedBox(width: width(context) * 0.025),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height(context) * 0.005),
                  Container(
                    width: width(context) * 0.3,
                    height: height(context)*0.015,
                    color: Colors.grey,

                  ),
                  SizedBox(height: height(context) * 0.015),
                  Container(
                    width: width(context) * 0.59,
                    height: height(context)*0.015,
                    color: Colors.grey,
                  ),
                  SizedBox(height: height(context) * 0.03),
                  Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Container(
                        width: width(context) * 0.3,
                        height: height(context)*0.015,
                        color: Colors.grey,

                      ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
