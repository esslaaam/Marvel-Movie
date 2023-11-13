
import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/use_cases/use_case.dart';
import 'package:movie_app/features/movies/data/models/search_model.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/movies/domain/repositories/movies_repo.dart';

class FetchResultSearchMoviesUseCase extends UseCases<List<MovieEntity>, SearchModel> {
  final MoviesRepo moviesRepo;

  FetchResultSearchMoviesUseCase(this.moviesRepo);

  @override
  Future<Either<Failure, List<MovieEntity>>> call([SearchModel? param]) async {
    return await moviesRepo.fetchSearchMovies(searchModel: param!);
  }
}
