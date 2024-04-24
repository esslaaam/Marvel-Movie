import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/features/movies/data/data_sources/movies_remote_data_sourse.dart';
import 'package:movie_app/features/movies/data/models/movie_model.dart';
import 'package:movie_app/features/movies/data/models/search_model.dart';
import 'package:movie_app/features/movies/data/networking/movies_api_client.dart';

import 'movies_remote_data_sourse_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<MoviesApiClient>(),
    MockSpec<MoviesResponseModel>(),
    MockSpec<SearchModel>(),
  ],
)
void main() {
  late MoviesApiClient apiClient;
  late MoviesRemoteDataSource moviesRemoteDataSource;
  late MoviesResponseModel moviesResponseModel;
  late SearchModel searchModel;
  setUp(() {
    apiClient = MockMoviesApiClient();
    moviesRemoteDataSource = MoviesRemoteDataSourceImpl(moviesApiClient: apiClient);
    moviesResponseModel = MockMoviesResponseModel();
    searchModel = MockSearchModel();
  });

  group("Movies Remote Data Source", () {
    /// Fetch Movies
    test("Fetch Movies", () async {
      when(apiClient.fetchMovies()).thenAnswer(
        (realInvocation) async => moviesResponseModel,
      );
      final result = await moviesRemoteDataSource.fetchMovies();
      expect(moviesResponseModel, result);
    });
    /// Fetch Search Movies
    test("Fetch Search Movies", () async {
      when(apiClient.fetchSearchMovies(
              textSearch: searchModel.textSearch,
              pageNumber: searchModel.pageNumber))
          .thenAnswer(
        (realInvocation) async => moviesResponseModel,
      );
      final result = await moviesRemoteDataSource.fetchSearchMovies(
          searchModel: searchModel);
      expect(moviesResponseModel, result);
    });
  });
}
