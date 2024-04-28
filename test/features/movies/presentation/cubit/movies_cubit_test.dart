import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/movies/data/models/search_model.dart';
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
    MockSpec<ServerFailure>(),
    MockSpec<SearchModel>(),
  ],
)
void main() {
  late FetchMoviesUseCase fetchMoviesUseCase;
  late FetchResultSearchMoviesUseCase fetchResultSearchMoviesUseCase;
  late MoviesCubit cubit;
  late List<MovieEntity> expectedSuccess;
  late ServerFailure expectedError;
  late SearchModel searchModel;

  setUp(() {
    fetchMoviesUseCase = MockFetchMoviesUseCase();
    fetchResultSearchMoviesUseCase = MockFetchResultSearchMoviesUseCase();
    cubit = MoviesCubit(fetchMoviesUseCase, fetchResultSearchMoviesUseCase);
    expectedSuccess = MockMovieList();
    expectedError = MockServerFailure();
    searchModel = MockSearchModel();
  });

  group("All Movie Cubit ", () {
    /// Fetch Movies

    blocTest<MoviesCubit, MoviesState>(
      'Fetch Movies Success',
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

    blocTest<MoviesCubit, MoviesState>(
      'Fetch Movies Error',
      build: () => cubit,
      act: (cubit) async {
        when(fetchMoviesUseCase.call()).thenAnswer(
          (realInvocation) async => Left(
            expectedError,
          ),
        );
        await cubit.fetchMovies();
      },
      expect: () => <MoviesState>[
        MoviesLoading(),
        MoviesFailure(expectedError.message),
      ],
    );

    /// Fetch Search Movies

    blocTest<MoviesCubit, MoviesState>(
      'Fetch Search Movies Success',
      build: () => cubit,
      act: (cubit) async {
        when(fetchResultSearchMoviesUseCase.call(searchModel)).thenAnswer(
          (realInvocation) async => Right(
            expectedSuccess,
          ),
        );
        await cubit.fetchResultSearchMovies(searchModel: searchModel);
      },
      expect: () => <MoviesState>[
        MoviesSearchLoading(),
        MoviesSearchSuccess(),
      ],
    );

    blocTest<MoviesCubit, MoviesState>(
      'Fetch Search Movies Error',
      build: () => cubit,
      act: (cubit) async {
        when(fetchResultSearchMoviesUseCase.call(searchModel)).thenAnswer(
          (realInvocation) async => Left(
            expectedError,
          ),
        );
        await cubit.fetchResultSearchMovies(searchModel: searchModel);
      },
      expect: () => <MoviesState>[
        MoviesSearchLoading(),
        MoviesSearchFailure(expectedError.message),
      ],
    );
  });
}
