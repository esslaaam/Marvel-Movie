import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/movies/data/data_sources/movies_remote_data_sourse.dart';
import 'package:movie_app/features/movies/data/models/movie_model.dart';
import 'package:movie_app/features/movies/data/models/search_model.dart';
import 'package:movie_app/features/movies/data/repos/movies_repos_impl.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';

import 'movies_repos_impl_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<MoviesRemoteDataSource>(),
    MockSpec<ServerFailure>(),
    MockSpec<List<MovieModel>>(as: Symbol("MockMoviesList")),
    MockSpec<SearchModel>(),
  ],
)
void main() {
  late MoviesRemoteDataSource moviesRemoteDataSource;
  late MoviesReposImpl moviesReposImpl;
  late List<MovieModel> expectedMovies;
  late SearchModel searchModel;
  late ServerFailure expectedError;

  setUp(() {
    moviesRemoteDataSource = MockMoviesRemoteDataSource();
    moviesReposImpl = MoviesReposImpl(moviesRemoteDataSource: moviesRemoteDataSource);
    expectedMovies = MockMoviesList();
    expectedError = MockServerFailure();
    searchModel = MockSearchModel();
  });
  List<MovieEntity> movies = [];
  group("Movies Repos Impl", () {

    /// Fetch List Of Movies

    test("Should Return Movies Response Model", () async {
      MoviesResponseModel responseModel =
          MoviesResponseModel(data: Data(movieModel: expectedMovies));
      when(moviesRemoteDataSource.fetchMovies()).thenAnswer(
        (realInvocation) async => responseModel,
      );
      movies = moviesReposImpl.getListMovies(responseModel.data!.movieModel);
      final res = await moviesReposImpl.fetchMovies();
      expect(
          movies,
          res.fold(
            (l) => expectedError,
            (r) => movies,
          ));
      verify(moviesRemoteDataSource.fetchMovies());
      verifyNoMoreInteractions(moviesRemoteDataSource);
    });
    test("Should Return Server Failure", () async {
      when(moviesRemoteDataSource.fetchMovies()).thenThrow(
        (realInvocation) async => expectedError,
      );
      final res = await moviesReposImpl.fetchMovies();
      expect(
          expectedError,
          res.fold(
            (l) => expectedError,
            (r) => movies,
          ));
      verify(moviesRemoteDataSource.fetchMovies());
      verifyNoMoreInteractions(moviesRemoteDataSource);
    });

    /// Fetch List Of Result Search Movies

    test("Should Return Movies Response Model", () async {
      MoviesResponseModel responseModel = MoviesResponseModel(data: Data(movieModel: expectedMovies));
      when(moviesRemoteDataSource.fetchSearchMovies(searchModel: searchModel))
          .thenAnswer(
        (realInvocation) async => responseModel,
      );
      movies = moviesReposImpl.getListMovies(responseModel.data!.movieModel);
      final res = await moviesReposImpl.fetchSearchMovies(searchModel: searchModel);
      expect(
          movies,
          res.fold(
            (l) => expectedError,
            (r) => movies,
          ));
      verify(moviesRemoteDataSource.fetchSearchMovies(searchModel: searchModel));
      verifyNoMoreInteractions(moviesRemoteDataSource);
    });
    test("Should Return Server Failure", () async {
      when(moviesRemoteDataSource.fetchSearchMovies(searchModel: searchModel)).thenThrow(
        (realInvocation) async => expectedError,
      );
      final res = await moviesReposImpl.fetchSearchMovies(searchModel: searchModel);
      expect(
          expectedError,
          res.fold(
            (l) => expectedError,
            (r) => movies,
          ));
      verify(moviesRemoteDataSource.fetchSearchMovies(searchModel: searchModel));
      verifyNoMoreInteractions(moviesRemoteDataSource);
    });
  });
}
