
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/use_cases/use_case.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/movies/domain/repositories/movies_repo.dart';

@lazySingleton
class FetchMoviesUseCase extends UseCases<List<MovieEntity>, int> {
  final MoviesRepo moviesRepo;

  FetchMoviesUseCase(this.moviesRepo);

  @override
  Future<Either<Failure, List<MovieEntity>>> call([int param = 0]) async {
    return await moviesRepo.fetchMovies(pageNumber: param);
  }
}
