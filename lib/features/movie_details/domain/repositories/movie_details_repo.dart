import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/movie_details/domain/entities/movie_details_entity.dart';

abstract class MovieDetailsRepo {
  Future<Either<Failure,MovieDetailsEntity>> fetchMovieDetails({required int id});
}
