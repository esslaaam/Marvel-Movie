import 'package:flutter/material.dart';

/// Navigator Push

 navigateTo({required BuildContext context, required Widget widget}) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => widget,
      ),
    );

/// Navigator Finish

 navigateAndFinish({required BuildContext context, required Widget widget}) => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
        (Route<dynamic> route) => false);

/// Navigator Pop

navigatorPop({required BuildContext context}) => Navigator.pop(context);

/// Navigator And Replace

navigateAndReplace({required BuildContext context, required Widget widget}) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
