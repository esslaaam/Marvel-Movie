import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/movies/data/models/search_model.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/movies/domain/repositories/movies_repo.dart';
import 'package:movie_app/features/movies/domain/use_cases/fetch_result_search_movies_use_case.dart';

import 'fetch_result_search_movies_use_case_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<SearchModel>(),
    MockSpec<MoviesRepo>(),
    MockSpec<ServerFailure>(),
    MockSpec<List<MovieEntity>>(as: Symbol("MockMoviesList")),
  ],
)
void main() {
  late MoviesRepo repo;
  late FetchResultSearchMoviesUseCase fetchResultSearchMoviesUseCase;
  late List<MovieEntity> expectedMovies;
  late ServerFailure expectedError;
  late SearchModel searchModel;

  setUp(() {
    repo = MockMoviesRepo();
    fetchResultSearchMoviesUseCase = FetchResultSearchMoviesUseCase(repo);
    expectedMovies = MockMoviesList();
    expectedError = MockServerFailure();
    searchModel = MockSearchModel();
  });

  test("Should Return List of Result Movies", () async {
    when(repo.fetchSearchMovies(searchModel: searchModel)).thenAnswer(
      (realInvocation) async => Right(expectedMovies),
    );
    final res = await fetchResultSearchMoviesUseCase.call(searchModel);
    verify(repo.fetchSearchMovies(searchModel: searchModel));
    verifyNoMoreInteractions(repo);
    expect(
        expectedMovies,
        res.fold(
          (l) => expectedError,
          (r) => expectedMovies,
        ));
  });

  test("Should Return Server Failure Error", () async {
    when(repo.fetchSearchMovies(searchModel: searchModel)).thenAnswer(
      (realInvocation) async => Left(
        expectedError,
      ),
    );
    final res = await fetchResultSearchMoviesUseCase.call(searchModel);
    verify(repo.fetchSearchMovies(searchModel: searchModel));
    verifyNoMoreInteractions(repo);
    expect(
        expectedError,
        res.fold(
          (l) => expectedError,
          (r) => expectedMovies,
        ));
  });
}
