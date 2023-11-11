import 'package:flutter/material.dart';


String currentTimeStamp() {
  DateTime now = DateTime.now();
  debugPrint(now.toString());
  debugPrint(now.millisecondsSinceEpoch.toString());
  return now.millisecondsSinceEpoch.toString();
}






