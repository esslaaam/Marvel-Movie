import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/core/utils/styles.dart';

import 'custom_details_text.dart';

class SomeDetails extends StatelessWidget {
  final String name;

  final String date;

  final String desc;

  final String numberOfComics;

  final String numbersOfEvents;

  final String numbersOfSeries;

  final String numbersOfStories;

  const SomeDetails(
      {super.key,
      required this.name,
      required this.date,
      required this.desc,
      required this.numberOfComics,
      required this.numbersOfEvents,
      required this.numbersOfSeries,
      required this.numbersOfStories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width(context) * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height(context) * 0.025),
          Center(
              child: Text(name,
                  style: Styles.textStyle30, textAlign: TextAlign.center)),
          SizedBox(height: height(context) * 0.02),
          CustomDetailsText(
            text: 'Description : ',
            value: desc == "" ? "There is no description" : desc,
          ),
          SizedBox(height: height(context) * 0.015),
          CustomDetailsText(
            text: 'Date : ',
            value: date,
          ),
          SizedBox(height: height(context) * 0.015),
          CustomDetailsText(
            text: 'Number of comics : ',
            value: numberOfComics == "0"
                ? "There are no comics available"
                : numberOfComics,
          ),
          SizedBox(height: height(context) * 0.015),
          CustomDetailsText(
            text: 'Number of events : ',
            value: numbersOfEvents == "0"
                ? "There are no events available"
                : numbersOfEvents,
          ),
          SizedBox(height: height(context) * 0.015),
          CustomDetailsText(
            text: 'Number of series : ',
            value: numbersOfSeries == "0"
                ? "There are no series available"
                : numbersOfSeries,
          ),
          SizedBox(height: height(context) * 0.015),
          CustomDetailsText(
            text: 'Number of stories : ',
            value: numbersOfStories == "0"
                ? "There are no stories available"
                : numbersOfStories,
          ),
          SizedBox(height: height(context) * 0.03),
        ],
      ),
    );
  }
}
