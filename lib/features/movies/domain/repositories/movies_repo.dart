import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/movies/data/models/search_model.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';

abstract class MoviesRepo {
  Future<Either<Failure, List<MovieEntity>>> fetchMovies({int pageNumber = 0});
  Future<Either<Failure, List<MovieEntity>>> fetchSearchMovies({required SearchModel searchModel});
}
