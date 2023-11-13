import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/colors.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomDetailsText extends StatelessWidget {
  final String text;

  final String value;

  const CustomDetailsText({super.key, required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: text,
              style:
                  Styles.textStyle15.copyWith(color: AppColors.kSecondaryBold)),
          TextSpan(text: value, style: Styles.textStyle15),
        ],
      ),
    );
  }
}
