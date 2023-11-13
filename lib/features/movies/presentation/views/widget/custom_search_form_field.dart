import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/colors.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomSearchFormField extends StatelessWidget {
  final void Function(String) onSearchChanged;
  final TextEditingController controller ;

  const CustomSearchFormField({super.key, required this.onSearchChanged, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width(context)*0.04,vertical: height(context)*0.02),
      child: TextFormField(
        onChanged: onSearchChanged,
        cursorColor: AppColors.kWhite,
        style: Styles.textStyle15,
        controller: controller,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.kFillField.withOpacity(0.25),
          hintText: 'Type here to search...',
          hintStyle: Styles.textStyle14,
          contentPadding: EdgeInsetsDirectional.symmetric(
              horizontal: width(context) * 0.035,
              vertical: height(context) * 0.015),
          errorBorder: buildOutlineInputBorder(color: AppColors.kRed),
          border: buildOutlineInputBorder(color: AppColors.kBorderRadiusField.withOpacity(0.66)),
          focusedBorder: buildOutlineInputBorder(color: AppColors.kBorderRadiusField.withOpacity(0.66)),
          enabledBorder: buildOutlineInputBorder(color: AppColors.kBorderRadiusField.withOpacity(0.66)),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({required Color color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(AppRadius.r25),
    );
  }
}
