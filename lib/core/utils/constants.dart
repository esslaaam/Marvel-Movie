import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

const String kAlmarai = "Almarai";
const String kApiKey = "d58e28b9d1481eefde876995ddddc816";
const String kHashKey = "bdf3ea30f988f407f46064f33e9db5a5";
const String kTs = "1699611552563";
const String kMovieDetailsBox = "movie_details_box";

class AppFonts {
  static final double t30 = 30.sp;
  static final double t18 = 18.sp;
  static final double t16 = 16.sp;
  static final double t15 = 15.sp;
  static final double t14 = 14.sp;
  static final double t11 = 11.sp;
}

class AppRadius {
  static final double r10 = 10.r;
  static final double r15 = 15.r;
  static final double r25 = 25.r;
}
