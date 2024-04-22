import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/use_cases/use_case.dart';
import 'package:movie_app/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movie_app/features/movie_details/domain/repositories/movie_details_repo.dart';

class FetchMovieDetailsUseCase extends UseCases<MovieDetailsEntity, int> {
  final MovieDetailsRepo movieDetailsRepo;

  FetchMovieDetailsUseCase(this.movieDetailsRepo);

  @override
  Future<Either<Failure, MovieDetailsEntity>> call([int? param]) async {
    return await movieDetailsRepo.fetchMovieDetails(id: param!);
  }
}
