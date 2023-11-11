import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/search/domain/entities/search_movie_entity.dart';

abstract class SearchMoviesRepo {
  Future<Either<Failure, List<SearchMovieEntity>>> fetchSearchMovies({int pageNumber = 0});
}
