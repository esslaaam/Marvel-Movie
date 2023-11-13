import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/colors.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  final void Function() onPressed;
  final String text ;

  const CustomButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width(context) * 0.3,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              backgroundColor: AppColors.kSecondaryBold,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.r10))),
          child: Text(text, style: Styles.textStyle16)),
    );
  }
}
