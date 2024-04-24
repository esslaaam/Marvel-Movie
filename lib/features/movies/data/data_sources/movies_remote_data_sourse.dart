import 'package:injectable/injectable.dart';
import 'package:movie_app/features/movies/data/models/search_model.dart';
import 'package:movie_app/features/movies/data/networking/movies_api_client.dart';

import '../models/movie_model.dart';

abstract class MoviesRemoteDataSource {
  Future<MoviesResponseModel> fetchMovies({int pageNumber = 0});

  Future<MoviesResponseModel> fetchSearchMovies(
      {required SearchModel searchModel});
}

@Injectable(as: MoviesRemoteDataSource)
class MoviesRemoteDataSourceImpl extends MoviesRemoteDataSource {
  final MoviesApiClient moviesApiClient;

  MoviesRemoteDataSourceImpl({required this.moviesApiClient});

  @override
  Future<MoviesResponseModel> fetchMovies({
    int pageNumber = 0,
  }) async {
    return await moviesApiClient.fetchMovies(
      pageNumber: pageNumber,
    );
  }

  @override
  Future<MoviesResponseModel> fetchSearchMovies({
    required SearchModel searchModel,
  }) async {
    return await moviesApiClient.fetchSearchMovies(
      pageNumber: searchModel.pageNumber,
      textSearch: searchModel.textSearch,
    );
  }
}
