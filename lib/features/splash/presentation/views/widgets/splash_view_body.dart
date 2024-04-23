import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/core/utils/images.dart';
import 'package:movie_app/core/utils/my_navigate.dart';
import '../../../../movies/presentation/views/movies_screen.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> opacityAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(animationController);

    animationController.forward();

    navigateToHome();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: opacityAnimation,
      builder: (context, child) {
        return Center(
          child: Opacity(
            opacity: opacityAnimation.value,
            child: Image.asset(
              AppImages.logo,
              width: width(context) * 0.6,
            ),
          ),
        );
      },
    );
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        navigateAndFinish(context: context, widget: const MoviesScreen());
      },
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
