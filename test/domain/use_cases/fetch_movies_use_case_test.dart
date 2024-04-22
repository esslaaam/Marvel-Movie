import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/movies/domain/repositories/movies_repo.dart';
import 'package:movie_app/features/movies/domain/use_cases/fetch_movies_use_case.dart';
import 'package:mockito/annotations.dart';

import 'fetch_movies_use_case_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<MoviesRepo>(),
    MockSpec<List<MovieEntity>>(as: Symbol("MockMoviesList"))
  ],
)
void main() {
  late MoviesRepo repo;
  late FetchMoviesUseCase fetchMoviesUseCase;
  late List<MovieEntity> expectedMovies ;

  setUp(() {
    repo = MockMoviesRepo();
    fetchMoviesUseCase = FetchMoviesUseCase(repo);
    expectedMovies = MockMoviesList();
  });

  test("should Return List of movies", () async {
    final expectedError = ServerFailure("Error");
    when(repo.fetchMovies()).thenThrow(
      (realInvocation) async => Left(
        expectedError,
      ),
    );
    when(repo.fetchMovies()).thenAnswer(
      (realInvocation) async => Right(expectedMovies),
    );
    final res = await fetchMoviesUseCase.call();
    verify(repo.fetchMovies());
    verifyNoMoreInteractions(repo);
    expect(
        expectedMovies,
        res.fold(
          (l) => expectedError,
          (r) => expectedMovies,
        ));
  });
}
