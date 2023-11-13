import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';

enum ToastStates { success, error, warning }

Color? toastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = AppColors.kPrimary;
      break;
    case ToastStates.error:
      color = AppColors.kRed;
      break;
    case ToastStates.warning:
      color = AppColors.kSecondaryBold;
      break;
  }
  return color;
}

showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: toastColor(state),
      textColor: AppColors.kWhite,
      fontSize: AppFonts.t15,
    );
