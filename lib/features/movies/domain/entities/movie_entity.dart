
class MovieEntity {
  final int filmId;
  final String? image;
  final String movieName;
  final String? date;
  final String? desc;

  MovieEntity(
      {required this.image,
      required this.movieName,
      required this.date,
      required this.desc,
      required this.filmId});
}
