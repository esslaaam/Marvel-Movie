import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text ;
  final TextStyle textStyle ;
  final Color backgroundColor ;
  final BorderRadiusGeometry? borderRadius ;
  const CustomButton({super.key, required this.backgroundColor, required this.text, required this.textStyle, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(12)
            )
          ),
          child: Text(text, style: textStyle)),
    );
  }
}
