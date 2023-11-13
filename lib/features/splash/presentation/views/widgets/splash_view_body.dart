import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/core/utils/images.dart';
import 'package:movie_app/core/utils/my_navigate.dart';
import 'package:movie_app/core/widget/fade_animation.dart';
import 'package:movie_app/features/movies/presentation/views/movies_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    navigateToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      1,
      2,
      Center(child: Image.asset(
        AppImages.logo,
        width: width(context) * 0.7,
      )),
    );
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 4), () {
      navigateAndFinish(context: context, widget: const MoviesView());
    });
  }
}
