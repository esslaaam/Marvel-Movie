import 'package:flutter/material.dart';
import 'colors.dart';
import 'constants.dart';

abstract class Styles {
  static final TextStyle textStyle10 = TextStyle(
      fontSize: AppFonts.t10,
      fontWeight: FontWeight.w400,
      color: AppColors.kSecondary);

  static final TextStyle textStyle12 = TextStyle(
      fontSize: AppFonts.t12,
      fontWeight: FontWeight.w400,
      color: AppColors.kGrayText);

  static final TextStyle textStyle13 = TextStyle(
      fontSize: AppFonts.t13,
      fontWeight: FontWeight.w400,
      color: AppColors.kCoffee);

  static final TextStyle textStyle14 = TextStyle(
      fontSize: AppFonts.t14,
      fontWeight: FontWeight.w400,
      color: AppColors.kGray);

  static final TextStyle textStyle16 = TextStyle(
      fontSize: AppFonts.t16,
      fontWeight: FontWeight.w400,
      color: AppColors.kWhite);

  static final TextStyle textStyle20 = TextStyle(
      fontSize: AppFonts.t20,
      fontWeight: FontWeight.w400,
      color: AppColors.kPrimary);
}
