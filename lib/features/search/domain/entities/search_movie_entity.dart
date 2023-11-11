import 'package:hive/hive.dart';

part 'search_movie_entity.g.dart';

@HiveType(typeId: 2)
class SearchMovieEntity {
  @HiveField(0)
  final int filmId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String movieName;
  @HiveField(3)
  final String? date;
  @HiveField(4)
  final String? desc;

  SearchMovieEntity(
      {required this.image,
      required this.movieName,
      required this.date,
      required this.desc,
      required this.filmId});
}
