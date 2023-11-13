import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';

class MoviesEmpty extends StatelessWidget {
  final String text;

  const MoviesEmpty({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: Styles.textStyle15,
          textAlign: TextAlign.center,
        )
      ],
    ));
  }
}
