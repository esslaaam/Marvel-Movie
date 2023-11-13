import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/colors.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/core/utils/my_navigate.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomAppBarMovieDetails extends StatelessWidget {
  const CustomAppBarMovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: width(context)*0.02,end: width(context)*0.02,top: height(context)*0.02),
      child: Row(
        children: [
          IconButton(onPressed: () {
            navigatorPop(context: context);
          }, icon: const Icon(Icons.arrow_back,color: AppColors.kWhite)),
          const Spacer(flex: 3),
          Text("Movie Details",style: Styles.textStyle18),
          const Spacer(flex: 4),
        ],
      ),
    );
  }
}
