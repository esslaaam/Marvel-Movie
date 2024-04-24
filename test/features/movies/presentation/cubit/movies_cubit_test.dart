import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/movies/domain/use_cases/fetch_movies_use_case.dart';
import 'package:movie_app/features/movies/domain/use_cases/fetch_result_search_movies_use_case.dart';
import 'package:movie_app/features/movies/presentation/cubit/movies_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'movies_cubit_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<FetchMoviesUseCase>(),
    MockSpec<FetchResultSearchMoviesUseCase>(),
    MockSpec<List<MovieEntity>>(as: Symbol("MockMovieList")),
  ],
)
void main() {
  late FetchMoviesUseCase fetchMoviesUseCase;
  late FetchResultSearchMoviesUseCase fetchResultSearchMoviesUseCase;
  late MoviesCubit cubit;
  late List<MovieEntity> expectedSuccess;

  setUp(() {
    fetchMoviesUseCase = MockFetchMoviesUseCase();
    fetchResultSearchMoviesUseCase = MockFetchResultSearchMoviesUseCase();
    cubit = MoviesCubit(fetchMoviesUseCase, fetchResultSearchMoviesUseCase);
    expectedSuccess = MockMovieList();
  });

  group("All Movie Cubit ", () {
    blocTest<MoviesCubit, MoviesState>(
      'Fetch Movies',
      build: () => cubit,
      act: (cubit) async {
        when(fetchMoviesUseCase.call()).thenAnswer(
          (realInvocation) async => Right(
            expectedSuccess,
          ),
        );
        await cubit.fetchMovies();
      },
      expect: () => <MoviesState>[
        MoviesLoading(),
        MoviesSuccess(),
      ],
    );
  });
}
