import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/colors.dart';

class LoadingDetails extends StatelessWidget {
  const LoadingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: CircularProgressIndicator(color: AppColors.kWhite))
          ]),
    );
  }
}
