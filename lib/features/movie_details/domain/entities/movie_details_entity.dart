import 'package:hive/hive.dart';

part 'movie_details_entity.g.dart';

@HiveType(typeId: 0)
class MovieDetailsEntity {
  @HiveField(0)
  final int? filmId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String movieName;
  @HiveField(3)
  final String? date;
  @HiveField(4)
  final String? desc;
  @HiveField(5)
  final int? numbersOfComics;
  @HiveField(6)
  final int? numbersOfSeries;
  @HiveField(7)
  final int? numbersOfStories;
  @HiveField(8)
  final int? numbersOfEvents;

  MovieDetailsEntity(
      {required this.filmId,
      required this.image,
      required this.movieName,
      required this.date,
      required this.desc,
      required this.numbersOfComics,
      required this.numbersOfSeries,
      required this.numbersOfStories,
      required this.numbersOfEvents});
}
