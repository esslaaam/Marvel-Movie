import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/core/utils/styles.dart';

import 'custom_button.dart';

class CustomError extends StatelessWidget {
  final String errMsg;

  final void Function() onPressed;

  const CustomError({super.key, required this.errMsg, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width(context) * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              errMsg,
              style: Styles.textStyle15,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height(context) * 0.01),
            CustomButton(onPressed: onPressed,text: "Retry")
          ],
        ),
      ),
    );
  }
}
