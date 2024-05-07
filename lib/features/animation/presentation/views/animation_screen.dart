import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/animation/presentation/views/widgets/fade_page_route.dart';
import 'package:movie_app/features/movies/presentation/views/movies_screen.dart';

import '../../../../core/utils/images.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  late final Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInBack,
      ),
    );
    animationController.forward();
    navigateToHome();
    super.initState();
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushAndRemoveUntil(
            context,
            FadePageRoute(
              builder: (context) => const MoviesScreen(),
            ),
            (Route<dynamic> route) => false);
      },
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: animationController,
        child: Center(
          child: Image.asset(
            AppImages.logo,
            height: 100.h,
          ),
        ),
        builder: (context, child) {
          return Opacity(
            opacity: animationController.value,
            child: child,
          );
        },
      ),
    );
  }
}
