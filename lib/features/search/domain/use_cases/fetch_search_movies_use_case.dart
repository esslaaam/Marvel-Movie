
import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/use_cases/use_case.dart';
import 'package:movie_app/features/search/domain/entities/search_movie_entity.dart';
import 'package:movie_app/features/search/domain/repositories/search_movies_repo.dart';

class FetchSearchMoviesUseCase extends UseCases<List<SearchMovieEntity>, int> {
  final SearchMoviesRepo searchMoviesRepo;

  FetchSearchMoviesUseCase(this.searchMoviesRepo);

  @override
  Future<Either<Failure, List<SearchMovieEntity>>> call([int? param]) async {
    return await searchMoviesRepo.fetchSearchMovies(pageNumber: param!);
  }
}
