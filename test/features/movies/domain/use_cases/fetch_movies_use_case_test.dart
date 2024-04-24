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
    MockSpec<List<MovieEntity>>(as: Symbol("MockMoviesList")),
    MockSpec<ServerFailure>()
  ],
)
void main() {
  late MoviesRepo repo;
  late FetchMoviesUseCase fetchMoviesUseCase;
  late List<MovieEntity> expectedMovies;
  late ServerFailure expectedError;
  setUp(() {
    repo = MockMoviesRepo();
    fetchMoviesUseCase = FetchMoviesUseCase(repo);
    expectedMovies = MockMoviesList();
    expectedError = MockServerFailure();
  });

  group("Fetch Movies Use Case", () {

    test("Should Return Server Failure Error", () async {
      when(repo.fetchMovies()).thenAnswer(
        (realInvocation) async => Left(
          expectedError,
        ),
      );
      final res = await fetchMoviesUseCase.call();
      verify(repo.fetchMovies());
      verifyNoMoreInteractions(repo);
      expect(
          expectedError,
          res.fold(
            (l) => expectedError,
            (r) => expectedMovies,
          ));
    });

    test("Should Return List of Movies", () async {
      when(repo.fetchMovies()).thenAnswer(
        (realInvocation) async => Right(
          expectedMovies,
        ),
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

  });
}
